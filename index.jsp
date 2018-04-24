<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String resultado = "0.0";
	String Altura = request.getParameter("altura");
	String Peso = request.getParameter("peso");
	
	if (Altura != null && Peso != null) {
		double altura = Double.parseDouble(Altura);
		double peso = Double.parseDouble(Peso);
		
		if (altura > 4) {
			altura = altura / 100;
		}
		if (peso > 200) {
			peso = peso / 1000;
		}

		double imc = peso / (altura * altura);
		String imcStr = Double.toString(imc);
		
		if (imcStr != "NaN") {
			if (imc > 40) {
				resultado = "> 40.0";
			}
			else if (imc < 18.5) {
				resultado = "< 18.5";
			}
			else {
				resultado = String.format("%.1f", imc);
			}
		}
	}
	else {
		Altura = "";
		Peso = "";
	}
%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
	<title>Calculadora de IMC - 2</title>

	<!-- Favicon -->
	<link rel="apple-touch-icon" sizes="57x57" href="img/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="img/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="img/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="img/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="img/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="img/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="img/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="img/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="img/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192" href="img/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="img/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="img/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="img/favicon/favicon-16x16.png">
	<link rel="manifest" href="img/favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="img/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">

	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta charset="utf-8" />

	<!--Import Google Icon Font-->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--Import materialize.css-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="css/style.css">
</head>

<body>
	<div id="background"></div>

	<div id="card" class="card">
		<div class="card-content">
			<h5>
				Calculadora de IMC
			</h5>

			<br>

			<form id="form">
				<div class="input-field">
					<input id="altura" name="altura" type="text" required value="<%out.print(Altura);%>" />
					<label for="altura">Altura (m ou cm)</label>
				</div>
				<div class="input-field">
					<input id="peso" name="peso" type="text" required value="<%out.print(Peso);%>" />
					<label for="peso">Peso (Kg ou g)</label>
				</div>

				<br />

				<div class="center">
					<button class="btn" type="submit">Resultado</button>
				</div>
				
				<br />
				<div class="divider"></div>
				
				<div class="center">
					<h2 id="result">
						<span class="font-size-20px">Seu IMC</span>
						<br/>
						<span id="resultado">
							<%
								out.println(resultado);
							%>
						</span>
						<b class="black-text font-size-12px">kg/m2</b>
					</h2>
				</div>
			</form>
		</div>
	</div>

	<!-- JS Vendor -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
	<!-- START MATERIALIZE -->
	<script type="text/javascript">
		$(document).on('load', function () {
			$('select').material_select();
		});
	</script>
</body>

</html>