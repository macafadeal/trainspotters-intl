// Ensures every `-webkit-appearance` declaration is accompanied by the
// standard `appearance` property, which Bootstrap's reboot omits.
const addStandardAppearance = () => ({
	postcssPlugin: "postcss-add-standard-appearance",
	Declaration: {
		"-webkit-appearance"(decl) {
			const already = decl.parent.nodes.some(
				(n) => n.type === "decl" && n.prop === "appearance",
			);
			if (!already) {
				decl.cloneAfter({ prop: "appearance", value: decl.value });
			}
		},
	},
});
addStandardAppearance.postcss = true;

module.exports = {
	plugins: [require("autoprefixer"), addStandardAppearance],
};
