//do not migrate preload script into TypeScript
/**
 * Preload script for main browser window (team sidebar).
 * For webapp context preload, check ssb-interop
 */
const startup = () => {
  require('./assign-metadata').assignMetadata();
  const { loadSettings } = window;

  const noCommitVersion = loadSettings.version.split('-')[0];
  const shouldSuppressErrors = loadSettings.devMode;
  require('../renderer/bugsnag-setup').setupBugsnag(shouldSuppressErrors, noCommitVersion);

  if (loadSettings.bootstrapScript) {
    require(loadSettings.bootstrapScript);
  }
};


document.addEventListener('DOMContentLoaded', function() { // eslint-disable-line
  try {
    startup();
  } catch (e) {
    //tslint:disable-next-line:no-console
    console.log(e.stack);

    if (window.Bugsnag) {
      window.Bugsnag.notify(e, 'Renderer crash');
    }

    throw e;
  }
});

// First make sure the wrapper app is loaded
document.addEventListener("DOMContentLoaded", function() {

   // Then get its webviews
   let webviews = document.querySelectorAll(".TeamView webview");

   // Fetch our CSS in parallel ahead of time
   const cssPath = 'https://cdn.rawgit.com/widget-/slack-black-theme/master/custom.css';
   let cssPromise = fetch(cssPath).then(response => response.text());

   let customCustomCSS = `
   :root {
      /* Modify these to change your theme colors: */
      --primary: #61AFEF;
      --text: #FF3D23;
    }
    div.c-message.c-message--light.c-message--hover
    {
      color: #FF3D23 !important;
    }

    span.c-message__body,
    a.c-message__sender_link,
    span.c-message_attachment__media_trigger.c-message_attachment__media_trigger--caption,
    div.p-message_pane__foreword__description span
    {
        color: #FF3D23 !important;
        font-family: Hack, Arial, Helvetica, sans-serif;
        text-rendering: optimizeLegibility;
        font-size: 14px;
        letter-spacing: -0.6px !important;
    }
    div.c-virtual_list__scroll_container {
      background-color: #000 !important;
    }
    .p-message_pane .c-message_list:not(.c-virtual_list--scrollbar), .p-message_pane .c-message_list.c-virtual_list--scrollbar > .c-scrollbar__hider {
         z-index: 0;
    }
    div.c-message__content:hover {
        background-color: #000 !important;
    }

    div.c-message:hover {
        background-color: #000 !important;
    }
   `;

   // Insert a style tag into the wrapper view
   cssPromise.then(css => {
      let s = document.createElement('style');
      s.type = 'text/css';
      s.innerHTML = css + customCustomCSS;
      document.head.appendChild(s);
   });

   // Wait for each webview to load
   webviews.forEach(webview => {
      webview.addEventListener('ipc-message', message => {
         if (message.channel == 'didFinishLoading')
            // Finally add the CSS into the webview
            cssPromise.then(css => {
               let script = `
                     let s = document.createElement('style');
                     s.type = 'text/css';
                     s.id = 'slack-custom-css';
                     s.innerHTML = \`${css + customCustomCSS}\`;
                     document.head.appendChild(s);
                     `
               webview.executeJavaScript(script);
            })
      });
   });
});
