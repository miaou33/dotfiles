"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
/**
 * Represents a colour as RGBA components.
 */
class Rgba {
    constructor(r = 0, g = 0, b = 0, a = 0) {
        this.r = r;
        this.g = g;
        this.b = b;
        this.a = a;
    }
    /**
     * Returns a copy of the given colour.
     *
     * @param rgba Colour to copy.
     * @return Copied RGBA instance.
     */
    static copy(rgba) {
        return new Rgba(rgba.r, rgba.g, rgba.b, rgba.a);
    }
    /**
     * Leniently parses a hex colour value into RGBA components.
     *
     * Accepts the forms: `#rgb`, `#rgba`, `#rrggbb`, `#rrggbbaa`.
     *
     * @param value Hex colour value.
     * @return New RGBA instance.
     */
    static parse(value) {
        var r = value.replace(/([^0-9a-fA-F])/, '');
        var c = r.length;
        var n = parseInt(r, 16);
        if (isNaN(n) || (c !== 3 && c !== 4 && c !== 6 && c !== 8)) {
            return new Rgba();
        }
        var a = 1;
        if (c === 3 || c === 4) {
            if (c === 4) {
                a = ((n & 0x000f) | (n & 0x000f) << 4) / 255;
                n >>= 4;
            }
            return new Rgba((n & 0xf00) >> 8 | (n & 0xf00) >> 4, (n & 0x0f0) >> 4 | (n & 0x0f0), (n & 0x00f) << 4 | (n & 0x00f), a);
        }
        if (c === 8) {
            a = (n & 0x000000ff) / 255;
            n >>= 8;
        }
        return new Rgba((n & 0xff0000) >> 16, (n & 0x00ff00) >> 8, (n & 0x0000ff), a);
    }
    /**
     * Returns the hex representation of this colour.
     * @return Hex colour value.
     */
    toHex() {
        let c = '#' + this.padByte(this.r) + this.padByte(this.g) + this.padByte(this.b);
        return this.a === 1 ? c : c + this.padByte(Math.round(this.a * 255));
    }
    /**
     * Overrides `JSON.stringify()` serialisation behaviour.
     * @return Hex colour value.
     */
    toJSON() {
        return this.toHex();
    }
    padByte(n) {
        return (0xf0 & n ? '' : '0') + n.toString(16);
    }
}
exports.Rgba = Rgba;
/**
 * Creates a new colour mixed from two others.
 *
 * Adapted from the source snippet available at:
 * http://sass-lang.com/documentation/Sass/Script/Functions.html#mix-instance_method
 *
 * @param c1 First colour to mix.
 * @param c2 Second colour to mix.
 * @param weight Weight of the first colour in the mixed output.
 * @return Mixed colour.
 */
function mix(c1, c2, weight = .5) {
    var p = weight;
    var w = p * 2 - 1;
    var a = c1.a - c2.a;
    var w1 = ((w * a === -1 ? w : (w + a) / (1 + w * a)) + 1) / 2;
    var w2 = 1 - w1;
    return new Rgba(Math.round(c1.r * w1 + c2.r * w2), Math.round(c1.g * w1 + c2.g * w2), Math.round(c1.b * w1 + c2.b * w2), c1.a * p + c2.a * (1 - p));
}
exports.mix = mix;
/**
 * Creates a new colour from fading out another.
 *
 * @param color Colour to fade.
 * @param amount Amount between 0 and 1 to fade by.
 * @return Faded colour.
 */
function fadeOut(color, amount) {
    let copy = Rgba.copy(color);
    copy.a -= amount;
    return copy;
}
exports.fadeOut = fadeOut;
/**
 * Returns the perceived brightness of a colour disregarding opacity.
 *
 * Perceived brightness formula source:
 * http://alienryderflex.com/hsp.html
 *
 * @param color Colour to get brightness of.
 * @return Brightness value.
 */
function brightness(color) {
    return Math.sqrt(.299 * color.r * color.r +
        .587 * color.g * color.g +
        .114 * color.b * color.b);
}
exports.brightness = brightness;
