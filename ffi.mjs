export const importObject = {
    JsValue: {
        undefined: () => undefined,
        null: () => null,
    },
    WebAPI_HTMLButtonElement: {
        new: (label) => {
            let button = document.createElement('button')
            button.textContent = label
            return button
        },
    },
};