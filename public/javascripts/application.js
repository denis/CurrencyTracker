$(
	function () {
		$('input.filter').keyup(
			function () {
				var value = this.value.toLowerCase();

				$(this).parents('table').find('td.name').each(
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

		$('#check_all').click(
		    function () {
		        $(this).parents('form').find('input[type=checkbox]:visible').attr('checked', true);
		    }
		);

		$('#clear_all').click(
		    function () {
		        $(this).parents('form').find('input[type=checkbox]:visible').attr('checked', false);
		    }
		);
	}
);
