$(
	function () {
		$('input.filter').keyup(
			function () {
				var value = this.value.toLowerCase();

				$(this).parents('table').find('td:first-child').each(
					function () {
						if ($(this).html().toLowerCase().indexOf(value) != -1) {
							$(this).parent().show();
						} else {
							$(this).parent().hide();
						}
					}
				);
			}
		).keyup();
	}
);
