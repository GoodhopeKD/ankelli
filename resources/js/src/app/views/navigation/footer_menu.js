import React from 'react'
import FAQsScreen from 'app/views/screens/footer_menu/FAQs.screen'
import PrivacyPolicyScreen from 'app/views/screens/footer_menu/PrivacyPolicy.screen'
import TermsOfServiceScreen from 'app/views/screens/footer_menu/TermsOfService.screen'

class ExampleElement extends React.Component {
    render() {
        return <this.props.PageWrapper title={this.props.title} path={this.props.path}>
            <div className="container-fluid py-3">
                {this.props.title} Screen
            </div>
        </this.props.PageWrapper>
    }
}

export const footer_menu = {
    slug: 'footer_menu',
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
                    title: 'Privacy Policy',
                    path: '/privacy-policy',
                    element: (props) => <PrivacyPolicyScreen {...props} />,
                },
                {
                    title: 'Terms Of Service',
                    path: '/terms-of-service',
                    element: (props) => <TermsOfServiceScreen {...props} />,
                },
                {
                    title: 'Blog',
                    path: '/blog_posts',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'View Post',
                    path: '/blog_posts/:blog_post_id',
                    element: (props) => <ExampleElement {...props} />,
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'Help',
            path: '/#/help',
            children: [
                {
                    title: 'FAQs',
                    path: '/faq',
                    element: (props) => <FAQsScreen {...props} />,
                },
                {
                    title: 'Learn mode',
                    path: '/learn',
                },
                {
                    title: 'Local outlets',
                    path: '/local_outlets',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Payment methods',
                    path: '/payment_methods',
                    element: (props) => <ExampleElement {...props} />,
                },
            ]
        },
        {
            title: 'Partners',
            path: '/#/help',
            children: [
                {
                    title: 'Paywyze',
                    path: '/partners/paywyze',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Ecocash',
                    path: '/partners/ecocash',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Stanbic Bank',
                    path: '/partners/stanbic-bank',
                    element: (props) => <ExampleElement {...props} />,
                },
                {
                    title: 'Mukuru',
                    path: '/partners/mukuru',
                    element: (props) => <ExampleElement {...props} />,
                },
            ]
        },
    ]
}
