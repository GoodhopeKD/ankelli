import FAQsScreen from 'app/views/screens/footer_menu/FAQs.screen'
import PrivacyPolicyScreen from 'app/views/screens/footer_menu/PrivacyPolicy.screen'
import TermsOfServiceScreen from 'app/views/screens/footer_menu/TermsOfService.screen'

export const footer_menu = {
    slug: 'footer_menu',
    menu_title: 'Footer Menu',
    auth_state_required: null,
    visible_in_menu: true,
    menu_items: [
        {
            title: 'Ankelli',
            path: '/#/ankelli',
            children: [
                {
                    title: 'About us',
                    path: '/about_us',
                    element: (props) => <div>Placeholder</div>,
                    faicon_class: "fas fa-gavel",
                },
                {
                    title: 'Contact us',
                    path: '/contact_us',
                    element: (props) => <div>Placeholder</div>,
                    faicon_class: "fas fa-gavel",
                },
                {
                    title: 'Contact form',
                    path: '/contact_us/contact_form',
                    element: (props) => <div>Placeholder</div>,
                    faicon_class: "fas fa-gavel",
                    visible_in_menu: false,
                },
                {
                    title: 'Blog Posts',
                    path: '/blog_posts',
                    element: (props) => <div>Placeholder</div>,
                    faicon_class: "fas fa-gavel",
                },
                {
                    title: 'View Post',
                    path: '/blog_posts/:blog_post_id',
                    element: (props) => <div>Placeholder</div>,
                    faicon_class: "fas fa-gavel",
                    visible_in_menu: false,
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
                    faicon_class: "fas fa-question-circle",
                },
                {
                    title: 'Privacy Policy',
                    path: '/privacy_policy',
                    element: (props) => <PrivacyPolicyScreen />,
                    faicon_class: "fas fa-user-tie",
                },
                {
                    title: 'Terms Of Service',
                    path: '/terms_of_service',
                    element: (props) => <TermsOfServiceScreen />,
                    faicon_class: "fas fa-gavel",
                },
            ]
        },
    ]
}
