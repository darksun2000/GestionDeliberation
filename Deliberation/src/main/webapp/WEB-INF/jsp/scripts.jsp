<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript"
src="/bower_components/jquery/dist/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/js/chosen.jquery.js"></script>

<script type="text/javascript">
var jQuery_3_5_1 = $.noConflict(true);
</script>

<script src="/bower_components/jquery/dist/jquery.min.js"></script>



<script src="/bootstrap/dist/js/bootstrap.min.js"></script>

<script src="/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>

<script src="/js/jquery.slimscroll.js"></script>

<script src="/js/waves.js"></script>
<!--Counter js -->
<script src="/bower_components/waypoints/lib/jquery.waypoints.js"></script>
<script src="/bower_components/counterup/jquery.counterup.min.js"></script>
<!--Morris JavaScript -->
<script src="/bower_components/raphael/raphael-min.js"></script>
<script src="/bower_components/morrisjs/morris.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/js/custom.min.js"></script>
<script src="/js/dashboard1.js"></script>
<script src="/bower_components/toast-master/js/jquery.toast.js"></script>
<script type="text/javascript" src="/js/datatables.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$
								.toast({
									heading : 'Bienvenue sur le tableau de bord du site de l\'administration Bachelor',
									text : '',
									position : 'top-right',
									loaderBg : '#ff6849',
									icon : 'info',
									hideAfter : 3500,
									stack : 6
								})
					});
	$('.datepicker').pickadate();
</script>
<link rel="stylesheet" type="text/css" href="/css/chosen.css">
<script type="text/javascript">
	jQuery_3_5_1(document).ready(function(){
		jQuery_3_5_1("#mselect").chosen();
	});
</script>

<script>

	$(document).ready(function() {
		$("#formCr").hide();
		$("#profileThumb").hide();
		$("#formCrDisp").click(function() {
			$("#listCr").hide();
			$("#formCr").show();
			$("#profileThumb").show();
		});
		$("#listCrDisp").click(function() {
			$("#listCr").show();
			$("#formCr").hide();
			$("#profileThumb").hide();
		});
	});
	$(document).ready(function() {
		$("#formAbs").hide();
		$("#profileThumb").hide();
		$("#formAbsDisp").click(function() {
			$("#listAbs").hide();
			$("#formAbs").show();
			$("#profileThumb").show();
		});
		$("#listAbsDisp").click(function() {
			$("#listAbs").show();
			$("#formAbs").hide();
			$("#profileThumb").hide();
		});
	});
	
	$(document).ready(function() {
		$("#triggerModal").click();
		$("#triggerModal").hide();		
	});
</script>
<script>
	$(document).ready(function() {

		$('#dtBasicExample').DataTable({
			"ordering" : true
		});
		$('.dataTables_length').addClass('bs-select');
	});
</script>

<script>
	function validateForm() {

		var start = document.forms["formDate"]["start_absence"].value;
		var end = document.forms["formDate"]["end_absence"].value;
		start = parseInt(start, 10);
		end = parseInt(end, 10);

		if (start < end) {
			var start = null;
			var end = null;
			return true;
		} else if (start > end) {
			alert("L'heure du début de l\'absence doit etre inférieure à celle de la fin");
			var start = null;
			var end = null;
			return false;
		} else if (start == end) {
			var start = null;
			var end = null;
			alert("L'heure du début de l'absence et celle de la fin ne peuvent etre égales.");
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;

	for (i = 0; i < dropdown.length; i++) {
		dropdown[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var dropdownContent = this.nextElementSibling;
			if (dropdownContent.style.display === "block") {
				dropdownContent.style.display = "none";
			} else {
				dropdownContent.style.display = "block";
			}
		});
	}
</script>
<script src="https://kit.fontawesome.com/a8b479b5ff.js"
	crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	 $("#change_mdp").hide();
	  $("#show_mdp_change").click(function(){
	    $("#change_mdp").show();
	  });
	});

</script>
