const js = require("@eslint/js");
const globals = require("globals");
const pluginN = require("eslint-plugin-n");
const pluginPromise = require("eslint-plugin-promise");

module.exports = [
	{
		ignores: ["node_modules/", "public/assets/", "vendor/", "log/", "tmp/"],
	},
	js.configs.recommended,
	pluginN.configs["flat/recommended"],
	pluginPromise.configs["flat/recommended"],
	{
		languageOptions: {
			ecmaVersion: 2024,
			sourceType: "module",
			globals: {
				...globals.browser,
				...globals.node,
			},
		},
		rules: {
			"no-unused-vars": [
				"error",
				{ argsIgnorePattern: "^_", caughtErrorsIgnorePattern: "^_" },
			],
			"no-var": "error",
			"prefer-const": "error",
			eqeqeq: "error",
			"no-console": ["warn", { allow: ["warn", "error"] }],
			"n/no-missing-import": "off",
			"n/no-unpublished-import": "off",
		},
	},
];
