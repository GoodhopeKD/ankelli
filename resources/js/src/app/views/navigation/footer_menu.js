import FAQsScreen from 'app/views/screens/footer_menu/FAQs.screen'
import PrivacyPolicyScreen from 'app/views/screens/footer_menu/PrivacyPolicy.screen'
import TermsOfServiceScreen from 'app/views/screens/footer_menu/TermsOfService.screen'

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
                    element: (props) => <div>Placeholder</div>,
                },
                {
                    title: 'Contact us',
                    path: '/contact',
                    element: (props) => <div>Placeholder</div>,
                },
                {
                    title: 'Contact form',
                    path: '/contact/form',
                    element: (props) => <div>Placeholder</div>,
                    show_in_menu: false,
                },
                {
                    title: 'Blog Posts',
                    path: '/blog_posts',
                    element: (props) => <div>Placeholder</div>,
                },
                {
                    title: 'View Post',
                    path: '/blog_posts/:blog_post_id',
                    element: (props) => <div>Placeholder</div>,
                    show_in_menu: false,
                },
            ]
        },
        {
            title: 'Help',
            path: '/#/help',
            children: [
                {
                    title: 'Frequently Asked Questions',
                    path: '/faq',
                    element: (props) => <FAQsScreen />,
                },
                {
                    title: 'Privacy Policy',
                    path: '/privacy-policy',
                    element: (props) => <PrivacyPolicyScreen />,
                },
                {
                    title: 'Terms Of Service',
                    path: '/terms-of-service',
                    element: (props) => <TermsOfServiceScreen />,
                },
            ]
        },
    ]
}
