#!/bin/sh
set -e


setup_kong() {
    # Ensure PORT is set and configure admin listening
    if [ -z "$PORT" ]; then
        echo "Error: PORT environment variable is not set"
        exit 1
    fi
    
    # To access Kong Manager OSS from a remote machine, ensure that admin_listen and admin_gui_listen are binding to 0.0.0.0 rather than 127.0.0.1
    # https://github.com/Kong/kong-manager?tab=readme-ov-file#server-usage
    export KONG_ADMIN_GUI_LISTEN="0.0.0.0:$PORT"
    echo "Configured Kong GUI to listen on: $KONG_ADMIN_GUI_LISTEN"

    if [ -z "$KONG_ADMIN_GUI_URL" ]; then
        echo "Error: KONG_ADMIN_GUI_URL environment variable is not set"
        echo "Please set KONG_ADMIN_GUI_URL to your app URL (e.g., https://my-kong-manager.herokuapp.com)"
        exit 1
    fi

    echo "Configured Kong Manager URL: $KONG_ADMIN_GUI_URL"

    # Configure Admin API URL - required
    if [ -z "$KONG_ADMIN_GUI_API_URL" ]; then
        echo "Error: KONG_ADMIN_GUI_API_URL environment variable is not set"
        echo "Please set KONG_ADMIN_GUI_API_URL to the external Admin API URL (e.g., https://admin-api.example.com)"
        exit 1
    fi
    export KONG_ADMIN_GUI_API_URL
    echo "Configured Kong Admin API URL: $KONG_ADMIN_GUI_API_URL"

}


setup_kong
echo "Successfully configured Kong"

# Execute the original entrypoint script
exec /docker-entrypoint.sh "$@" 