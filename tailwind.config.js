module.exports = {
        daisyui: {
                themes: [{
                        mytheme: {
                                "primary": "#84aea0",
                                "secondary": "#B85961",
                                "accent": "#00bfb2",
                                "neutral": "#44826F",
                                "base-100": "#111827",
                                "info": "#00bfb2",
                                "success": "#007a78",
                                "warning": "#ffc845",
                                "error": "#e56db1",
                        },
                },],
        },
        theme: {
                extend: {
                        fontFamily: {
                                inter: ["Inter", "sans-serif"],
                                lexend: ["Lexend", "sans-serif"],
                                baloo: ["Baloo 2", "cursive"],
                                rubik: ["Rubik", "sans-serif"],
                        },
                },
        },
        content: [
                './app/views/**/*.html.haml',
                './app/helpers/**/*.rb',
                './app/assets/stylesheets/**/*.css',
                './app/javascript/**/*.js'
        ],
        plugins: [require("daisyui")]
}
