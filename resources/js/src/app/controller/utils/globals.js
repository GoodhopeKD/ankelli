import _Date from 'app/controller/wrappers/auxilliary/_Date'

Array.prototype.move = function (from, to) {
	this.splice(to, 0, this.splice(from, 1)[0])
	return this
}

String.prototype.capitalize = function () {
	return this.toLowerCase().split(' ').map(function (i) {
		if (i.length > 2) {
			return i.charAt(0).toUpperCase() + i.substr(1);
		}
		return i;
	}).join(' ');
};

window.isJson = function (item) {
	item = typeof item !== "string"
		? JSON.stringify(item)
		: item;

	try {
		item = JSON.parse(item);
	} catch (e) {
		return false;
	}

	if (typeof item === "object" && item !== null) {
		return true;
	}

	return false;
}

window.ucfirst = function (s) {
	return s && s.length ? s[0].toUpperCase() + s.slice(1) : ''
}

window.isset = function (v) {
	return !(v === null || v === undefined)
}

window.padUserAvatarImageId = (number = undefined) => {
	if (!number) return undefined
	switch ((number + '').length) {
		case 1: return '00' + number
		case 2: return '0' + number
		default: return number
	}
}

window.currencyAmountInput = (amount, round_down = false) => {
	if (!window.isNumeric(amount)) return ''
	const rounder = round_down ? Math.floor : Math.round
	return rounder((parseFloat(amount) + Number.EPSILON) * 100) / 100
}

window.currencyAmountString = (amount, currency = { symbol: '' }, show_symbol = true, round_down = false) => {
	var output = window.currencyAmountInput(amount, round_down).toLocaleString('zw-ZW')
	output = ('' + output).length > 0 ? output : 0
	return (currency.symbol_before_number ? (show_symbol ? currency.symbol : '') : '') + output + (currency.symbol_before_number ? '' : (show_symbol ? currency.symbol : ''))
}

window.assetValueInput = (value, asset = { smallest_display_unit: 0.01 }, round_down = false) => {
	if (!window.isNumeric(value)) return ''
	const rounder = round_down ? Math.floor : Math.round
	const some_const = Math.round(1 / parseFloat(asset.smallest_display_unit))
	return rounder((parseFloat(value) + Number.EPSILON) * some_const) / some_const
}

window.assetValueString = (value, asset = { unit: '', smallest_display_unit: 0.01 }, show_code = true, round_down = false) => {
	var output = window.assetValueInput(value, asset, round_down)
	output = ('' + output).length > 0 ? output : 0
	return output + (show_code ? ' ' + asset.unit : '')
}

window.instanceToRespObj = (obj) => {
	if (null === obj || 'object' != typeof obj) return obj
	if (obj instanceof _Date) {
		return obj + ''
	}
	var copy
	if (obj instanceof Array) {
		copy = []
		for (var i = 0, len = obj.length; i < len; i++) {
			copy[i] = window.instanceToRespObj(obj[i])
		}
		return copy
	}
	if (obj instanceof Object) {
		copy = {}
		for (var attr in obj) {
			if (obj.hasOwnProperty(attr)) copy[attr] = window.instanceToRespObj(obj[attr])
		}
		return copy
	}
}

window.compareVersions = function (v1, comparator, v2) {
	comparator = comparator === '=' ? '==' : comparator
	if (['==', '===', '<', '<=', '>', '>=', '!=', '!=='].indexOf(comparator) === -1) {
		throw new Error('Invalid comparator. ' + comparator)
	}
	var v1parts = v1.split('.'),
		v2parts = v2.split('.')
	var maxLen = Math.max(v1parts.length, v2parts.length)
	var part1, part2
	var cmp = 0
	for (var i = 0; i < maxLen && !cmp; i++) {
		part1 = parseInt(v1parts[i], 10) || 0
		part2 = parseInt(v2parts[i], 10) || 0
		if (part1 < part2) cmp = 1
		if (part1 > part2) cmp = -1
	}
	return eval('0' + comparator + cmp)
}

window.arrayShuffle = function (array) {
	var currentIndex = array.length,
		randomIndex
	while (0 !== currentIndex) {
		randomIndex = Math.floor(Math.random() * currentIndex)
		currentIndex--
		[array[currentIndex], array[randomIndex]] = [array[randomIndex], array[currentIndex]]
	}
	return array
}

window.isNumeric = function (str) {
	return !isNaN(str) && // use type coercion to parse the _entirety_ of the string (`parseFloat` alone does not do this)...
		!isNaN(parseFloat(str)) // ...and ensure strings of whitespace fail
}

window.romanize = function (num) {
	if (isNaN(num))
		return NaN
	var digits = String(+num).split(''),
		key = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM',
			'', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC',
			'', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'],
		roman = '',
		i = 3
	while (i--)
		roman = (key[+digits.pop() + (i * 10)] || '') + roman
	return Array(+digits.join('') + 1).join('M') + roman
}
