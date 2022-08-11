import React from "react"
import { connect } from 'react-redux'
import { Link } from "react-router-dom";

import { _Offer, _Currency } from 'app/controller'

class BgTaskHandler { static runInBackground = (fn) => fn() }

class OffersListViewScreen extends React.Component {

    working = false

    state = {
        offers_list_loaded: false,
        list: [],
        list_loaded: false,
        list_full: false,
        list_refreshing: false,

        get_collection_params: {
            offer_to: 'buy',
            country: undefined,
            currency_code: undefined,
            asset_code: undefined,
            pymt_method_slug: undefined,
        },
        page_select: {
            page: 1,
        },
        per_page: 15
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
        this.initialFetch = async (show_list_refreshing_loader = true) => {
            this.setState({ list_refreshing: show_list_refreshing_loader });
            await this.universalGetCollection(_Offer, 'offers_list_loaded', JSON.parse(JSON.stringify(this.state.get_collection_params)), this.state.page_select, this.state.per_page)
            if (show_list_refreshing_loader) this.setState({ list_refreshing: false })
        };
        const bgTask = () => this.initialFetch(false)
        try { BgTaskHandler.runInBackground(() => bgTask()) } catch (e) { bgTask() }
    }

    render() {

        const priceString = (price, currency) => {
            currency = typeof currency !== 'undefined' ? currency : { symbol: '' }
            return (currency.symbol_before_number ? currency.symbol : '') + (Math.round((parseFloat(price) + Number.EPSILON) * 100) / 100).toLocaleString('zw-ZW') + (currency.symbol_before_number ? '' : currency.symbol)
        }

        return <div className="container p-2">
            
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
                                const currency = this.props.datalists.active_currencies[offer.currency_code]
                                const pymt_method = this.props.datalists.active_pymt_methods[offer.pymt_method_slug]
                                return <tr key={index} >
                                    <td><i>@{offer.creator_username}</i><br />#{offer.location}</td>
                                    {offer.offer_to == 'buy' && <td><b>{offer.asset_code}</b> <i>for</i> <b>{offer.currency_code}</b></td>}
                                    {offer.offer_to == 'sell' && <td><b>{offer.currency_code}</b> <i>for</i> <b>{offer.asset_code}</b></td>}
                                    <td>{priceString(offer.asset_purchase_price, currency)}</td>
                                    <td>{priceString(offer.min_purchase_amount, currency)} - {priceString(offer.max_purchase_amount, currency)}</td>
                                    <td className="align-middle">
                                        <img src={pymt_method.icon.uri} alt={pymt_method.name + " icon"} width="40" height="40" className="rounded-circle me-2" />
                                        {pymt_method.name}
                                    </td>
                                    <td className="align-middle">
                                        <div className="btn-group">
                                            <button type="button" className="btn btn-sm btn-outline-secondary">•••</button>
                                            <Link to={'/offers/' + offer.ref_code} className='btn btn-danger' >Sell</Link>
                                        </div>
                                    </td>
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

const mapStateToProps = (state) => {
    return {
        datalists: state.datalists_data,
    }
}

export default connect(mapStateToProps)(OffersListViewScreen)