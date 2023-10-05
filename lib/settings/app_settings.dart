// title of the app
String appTitle = "MNotes";

// map of the routes used in the app
Map<String, String> appRoutes = {
  "login": "/login",
  "signup_1": "/signup/1",
  "signup_2": "/signup/2",
  "contact_details": "/contact",
  "settings_submenu": "/settings/submenu",
  "home": "/home"
};

// base endpoint url for the backend
String baseEndpointUrl = "https://dev.mnotes.it/api";

// list of all the api endpoints used in the app
Map<String, Map<String, String>> apiEndpoints = {
  "auth": {
    "login": "$baseEndpointUrl/auth/login",
    "signup": "$baseEndpointUrl/auth/signup",
    "logout": "$baseEndpointUrl/auth/logout",
    "token": "$baseEndpointUrl/auth/token",
  },
  "contacts": {
    "list": "$baseEndpointUrl/contacts",
    "detail": "$baseEndpointUrl/contacts/<id>",
    "create": "$baseEndpointUrl/contacts",
    "upload_image": "$baseEndpointUrl/contacts/<id>/image",
    "update": "$baseEndpointUrl/contacts/<id>",
    "delete": "$baseEndpointUrl/contacts/<id>",
    "attach_media": "$baseEndpointUrl/contacts/<id>/media",
    "notes": "$baseEndpointUrl/contacts/<id>/notes",
    "media": "$baseEndpointUrl/contacts/<id>/media",
  },
  "notes": {
    "list": "$baseEndpointUrl/notes",
    "detail": "$baseEndpointUrl/notes/<id>",
    "create": "$baseEndpointUrl/notes",
    "update": "$baseEndpointUrl/notes/<id>",
    "delete": "$baseEndpointUrl/notes/<id>",
    "attach_media": "$baseEndpointUrl/notes/<id>/media",
    "media": "$baseEndpointUrl/notes/<id>/media",
  },
  "media": {
    "list": "$baseEndpointUrl/media",
    "detail": "$baseEndpointUrl/media/<id>",
    "update": "$baseEndpointUrl/media/<id>",
    "delete": "$baseEndpointUrl/media/<id>",
  },
  "users": {
    "detail": "$baseEndpointUrl/users/me",
  }
};