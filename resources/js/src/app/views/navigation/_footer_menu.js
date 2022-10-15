import React from 'react'
import FAQsScreen from 'app/views/screens/FAQs.screen'
import PrivacyPolicyScreen from 'app/views/screens/PrivacyPolicy.screen'
import TermsOfServiceScreen from 'app/views/screens/TermsOfService.screen'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-xl py-5">
                {this.props.title} screen
            </div>
        </this.props.PageWrapper>
    }
}

export const _footer_menu = {
    slug: '_footer_menu',
    subdomain: 'default',
    menu_title: 'Footer Menu',
    show_in_menu: true,
    menu_items: [
        {
            title: 'Ankelli',
            path: '/#/ankelli',
            children: [
                {
                    title: 'About us',
                    path: '/about',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Privacy policy',
                    path: '/privacy-policy',
                    element: (props) => <PrivacyPolicyScreen {...props} />,
                },
                {
                    title: 'Terms of service',
                    path: '/terms-of-service',
                    element: (props) => <TermsOfServiceScreen {...props} />,
                },
                {
                    title: 'Blog',
                    path: '/blog-posts',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'View Post',
                    path: '/blog-posts/:blog_post_id',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Team',
                    path: '/team',
                    element: (props) => <ExampleElement {...props} />,
                },
            ]
        },
        {
            title: 'Help',
            path: '/#/help',
            children: [
                {
                    title: 'Learn',
                    path: '/learn',
                },
                {
                    title: 'FAQs',
                    path: '/faq',
                    element: (props) => <FAQsScreen {...props} />,
                },
                {
                    title: 'Contact us',
                    path: '/contact',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Contact form',
                    path: '/contact/form',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
                {
                    title: 'Find us',
                    path: '/find-us',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Support center',
                    path: '/home',
                    subdomain: 'support',
                    restricted_for_default_users: true,
                },
            ]
        },
        {
            title: 'Useful lists',
            path: '/#/useful-lists',
            children: [
                {
                    title: 'Accepted payments',
                    path: '/accepted-payments',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Accepted currencies',
                    path: '/accepted-currencies',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Supported crypto',
                    path: '/supported-crypto',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Serviced countries',
                    path: '/serviced-countries',
                    element: (props) => <ExampleElement {...props} />,
                },
            ]
        },
    ]
}
