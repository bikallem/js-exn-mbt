export const importObject = {
    JsValue: {
        undefined: () => undefined,
        null: () => null,
    },
    JsNull: {
        null: () => null,
    },
    webapi_HTMLButtonElement: {
        new: (label) => {
            let button = document.createElement('button')
            button.textContent = label
            return button
        },
    },
    webapi_Document: {
        new: () => document,
        body: (document) => document.body,
        querySelector: (document, selector) => document.querySelector(selector),
    },
    webapi_HTMLBodyElement: {
        appendChild: (body, child) => body.appendChild(child),
    },
    webapi_AddEventListenerOptions: {
        new: (capture, passive, once, signal) => ({ capture, passive, once, signal }),
    },
    webapi_Dictionary: {
        empty: () => ({}),
    },
    webapi_EventTarget: {
        addEventListener: (obj, type, listener, options) => obj.addEventListener(type, listener, options),
    },
    webapi_EventListenerOptions: {
        new: (capture) => ({ capture }),
    },
    webapi_RemoveEventListenerOptionsArg: {
        removeEventListener: (obj, type, listener, options) => obj.removeEventListener(type, listener, options),
    },
};