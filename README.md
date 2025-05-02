# Kong Manager (GUI) on Heroku

This repository contains a Dockerized "Kong Manager (GUI)" configured to run on Heroku. Kong is a popular, open-source API Gateway that helps you manage, secure, and monitor your APIs.

## Disclaimer

The author of this article makes any warranties about the completeness, reliability and accuracy of this information. **Any action you take upon the information of this website is strictly at your own risk**, and the author will not be liable for any losses and damages in connection with the use of the website and the information provided. **None of the items included in this repository form a part of the Heroku Services.**

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Prerequisites

- A Heroku account
- Heroku CLI installed
- Docker installed (for local development)


## Deployment Steps

1. Create a new Heroku app:
   ```bash
   heroku create your-app-name
   ```

2. Deploy the application:
   ```bash
   git push heroku main
   ```

## Environment Variables

The following environment variables are required for this app to run (see `app.json` for details):

- `KONG_ADMIN_GUI_URL` (required): Public URL for Kong Manager GUI (e.g., https://my-kong-manager.herokuapp.com)
- `KONG_ADMIN_GUI_API_URL` (required): External Admin API URL (e.g., https://admin-api.example.com)
- `KONG_ADMIN_GUI_LISTEN`: Set automatically by the bootstrap script to `0.0.0.0:$PORT`


## ⚠️ Security Notice

**This implementation does NOT provide a secured Kong Manager.**

- There is no enforced HTTPS/SSL for the Kong Manager GUI.
- No authentication or RBAC is enabled by default with Kon OSS.
- The GUI is accessible to anyone who knows the URL.

**Do NOT use this setup in production or for sensitive workloads without adding proper security controls (HTTPS, firewall, authentication, etc.).**

## Configuration

The Kong gateway is configured using the following files:
- `kong.conf`: Main configuration file
- `kong.yaml`: Declarative configuration for routes and services
- `Dockerfile`: Container configuration and bootstrap script

Environment variables are set via the Heroku dashboard or `app.json` and are required for proper operation.


## Verification

You can verify that Kong Manager is running properly by checking the logs:

```bash
heroku logs --tail
```

You should see messages indicating that Kong has started successfully and is listening for requests.

Then you can open your Heorku app showing the Kong Manager GUI.


## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## Support

For issues and questions, please open an issue in the GitHub repository.


