import React from "react"
import { Link } from "react-router-dom";

import { _Offer, _Currency } from 'app/controller'

class BgTaskHandler { static runInBackground = (fn) => fn() }

export default class OffersListViewScreen extends React.Component {

    working = false

    state = {
        offers_to: 'buy',
        offers_list_loaded: false,
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,
        currencies: {}
    };

    async universalGetCollection(_Type, indicator_var_name, get_collection_params = null, page_select = null, per_page = null) {
        if (page_select && this.state.list_full) return Promise.resolve();
        if (!this.working) {
            this.working = true
            setTimeout(
                () => {
                    _Type.getCollection(get_collection_params, page_select, per_page)
                        .then(({ collection }) => {
                            if (!collection.data) return Promise.resolve();
                            let update_object = {
                                list: page_select ? this.state.list.concat(collection.data) : collection.data,
                                list_loaded: true,
                                list_full: collection.meta.current_page === collection.meta.last_page,
                            };
                            update_object[indicator_var_name] = true;
                            this.setState(update_object);
                            this.working = false
                            return Promise.resolve();
                        })
                        .catch((error) => {
                            this.working = false
                            return Promise.reject(error);
                        })
                }, 0
            );
        } else {
            return Promise.resolve();
        }
    }

    componentDidMount() {
        if (!Object.keys(this.state.currencies).length)
            _Currency.getCollection().then(resp => {
                const currencies = {}
                resp.collection.data.forEach(element => {
                    currencies[element.code] = element
                });
                this.setState({ currencies })
            })

        this.initialFetch = async (show_list_refreshing_loader = true) => {
            this.setState({ list_refreshing: show_list_refreshing_loader });
            await this.universalGetCollection(_Offer, 'offers_list_loaded', { offers_to: this.state.offers_to })
            if (show_list_refreshing_loader) this.setState({ list_refreshing: false })
        };
        this.nextFetch = () => this.universalGetCollection(_Offer, 'offers_list_loaded', { offers_to: this.state.offers_to }, 'next');

        //this._unsubscribeFocusListener = this.props.navigation.addListener('focus', () => {
        const bgTask = () => this.initialFetch(false)
        try { BgTaskHandler.runInBackground(() => bgTask()) } catch (e) { bgTask() }
        //});
    }

    render() {

        const priceString = (price, currency) => {
            return (currency.symbol_before_amount ? currency.symbol : '') + (Math.round((parseFloat(price) + Number.EPSILON) * 100) / 100) + (currency.symbol_before_amount ? '' : currency.symbol)
        }

        return <div className="container">
            {this.state.list_loaded && this.state.list_full ? (
                <div>
                    <table className="table">
                        <thead>
                            <tr>
                                <th scope="col">Buyer</th>
                                <th scope="col">Trading</th>
                                <th scope="col">Price</th>
                                <th scope="col">Limit</th>
                                <th scope="col">Payment method</th>
                                <th scope="col">Sell</th>
                            </tr>
                        </thead>
                        <tbody>
                            {this.state.list.map((offer, index) => {
                                const currency = this.state.currencies[offer.currency_code]
                                return <tr key={index} >
                                    <td>{offer.creator_username}<br />{offer.country}</td>
                                    <td>{offer.currency_code} - {offer.asset_code}</td>
                                    <td>{priceString(offer.asset_purchase_price, currency)}</td>
                                    <td>{priceString(offer.min_purchase_amount, currency)} - {priceString(offer.max_purchase_amount, currency)}</td>
                                    <td>{offer.payment_method_slug}</td>
                                    <td><Link to={'/offers/' + offer.ref_code} className='btn btn-danger' >Sell {offer.asset_code}</Link></td>
                                </tr>
                            })}
                        </tbody>
                    </table>
                </div>
            ) : (
                <div style={{ alignItems: 'center', padding: 40 }} className='d-grid'>
                    <div className="spinner-grow text-danger" style={{ justifySelf: 'center', width: 50, height: 50 }}></div>
                </div>
            )}
        </div>
    }
}