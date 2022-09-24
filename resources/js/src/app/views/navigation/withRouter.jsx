import React, { useEffect } from "react"
import { useParams, useNavigate, useLocation } from 'react-router-dom';

function withRouter(Child) {

    return (props) => {

        /*const navigate = useNavigate()
        useEffect(() => {
            if (props.path == "/offers/new") {
                navigate('/signin?rdr=/offers/new')
            }
        }, []);*/

        return <Child {...props} params={useParams()} navigate={useNavigate()} location={useLocation()} />;
    }
}

export default withRouter