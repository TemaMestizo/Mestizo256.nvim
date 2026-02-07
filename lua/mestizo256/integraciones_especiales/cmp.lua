return {
	completion = {
		border = "rounded",
		winhighlight = table.concat({
			"Normal:CmpNormal",
			"FloatBorder:CmpBorder",
			"CursorLine:CmpCursorLine",
			"Search:CmpSearch",
		}, ","),
	},
	documentation = {
		border = "rounded",
		winhighlight = table.concat({
			"Normal:CmpDocumentationNormal",
			"FloatBorder:CmpDocumentationBorder",
			"CursorLine:CmpDocumentationCursorLine",
			"Search:CmpDocumentationSearch",
		}, ","),
	},
}
