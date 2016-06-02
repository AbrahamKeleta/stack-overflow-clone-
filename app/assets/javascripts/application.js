// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .



$(function() {

	// Make page look nice
	var height = $(window).height();
	$('.second-half').css('height', height - 90);
	$('.queue').css('height', height - 225);
	




	$('.single_issue').click(function(e) {
		e.preventDefault();
		var data = $('#' + this.id).data('clicked-issue');
		document.getElementById('original').innerHTML = data['solution'];
		document.getElementById('latest-queue-title').innerHTML = data['queue'];
		format_text(document.getElementById('original').innerHTML);
	});

	$('#help').click(function(e) {
		e.preventDefault();
		if ($('.help-info').is(':visible')) {
			$('.help-info').css('display', 'none');
		} else {
			$('.help-info').css('display', 'block');
		}
	});


	var format_text = function(text) {
		var soln = document.getElementById('original');
		if (soln.innerHTML.replace(/\s/g, '').length == 0) {
			$('.current-content').hide();
			$('.no-solution').show();
		} else {
			$('.current-content').show();
			$('.no-solution').hide();
			var content = soln.innerHTML;
			soln.innerHTML = '';
			var counter = 0;
			for (i = 0; i < content.length; i++) {
				if (content[i] == '`' && content[i + 1] == '`' && content[i + 2] == '`') {
					i  +=3;  
					var arr = [];
					while (content[i] != '`') {
						arr.push(content[i]);
						i++;
					}
					var highlighted_syntax = "<pre class='highlighted-content'>"  + arr.join('') + "</pre>";
					$('#original').append(highlighted_syntax);
					i += 3;
				} else {
					soln.innerHTML += content[i];
					soln.style.display = 'block';
				}
			}
		}
	} 
	format_text(document.getElementById('original').innerHTML);
});

