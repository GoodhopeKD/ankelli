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
                    path: '/about_us',
                    element: (props) => <div>Placeholder</div>,
                },
                {
                    title: 'Contact us',
                    path: '/contact_us',
                    element: (props) => <div>Placeholder</div>,
                },
                {
                    title: 'Contact form',
                    path: '/contact_us/contact_form',
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
                    path: '/privacy_policy',
                    element: (props) => <PrivacyPolicyScreen />,
                },
                {
                    title: 'Terms Of Service',
                    path: '/terms_of_service',
                    element: (props) => <TermsOfServiceScreen />,
                },
            ]
        },
    ]
}
