<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<layout:extends name="layout.jsp">
	<layout:put block="content" type="REPLACE">

		<style>
html, body {
	min-height: 100%;
}

body, div, form, input, select, p {
	padding: 0;
	margin: 0;
	outline: none;
	font-family: Roboto, Arial, sans-serif;
	font-size: 14px;
	color: #666;
}

h1 {
	margin: 0;
	font-weight: 400;
}

h3 {
	margin: 12px 0;
	color: #8ebf42;
}

.main-block {
	display: flex;
	justify-content: center;
	align-items: center;
	background: #fff;
}

form {
	width: 100%;
	padding: 20px;
}

fieldset {
	border: none;
	border-top: 1px solid #8ebf42;
}

.account-details, .personal-details {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.account-details>div, .personal-details>div>div {
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}

.account-details>div, .personal-details>div, input, label {
	width: 100%;
}

label {
	padding: 0 5px;
	text-align: right;
	vertical-align: middle;
}

input {
	padding: 5px;
	vertical-align: middle;
}

.checkbox {
	margin-bottom: 10px;
}

select, .children, .gender, .bdate-block {
	width: calc(100% + 26px);
	padding: 5px 0;
}

select {
	background: transparent;
}

.gender input {
	width: auto;
}

.gender label {
	padding: 0 5px 0 0;
}

.bdate-block {
	display: flex;
	justify-content: space-between;
}

.birthdate select.day {
	width: 35px;
}

.birthdate select.mounth {
	width: calc(100% - 94px);
}

.birthdate input {
	width: 38px;
	vertical-align: unset;
}

.checkbox input, .children input {
	width: auto;
	margin: -2px 10px 0 0;
}

.checkbox a {
	color: #8ebf42;
}

.checkbox a:hover {
	color: #82b534;
}

button {
	width: 100%;
	padding: 10px 0;
	margin: 10px auto;
	border-radius: 5px;
	border: none;
	background: #8ebf42;
	font-size: 14px;
	font-weight: 600;
	color: #fff;
}

button:hover {
	background: #82b534;
}

@media ( min-width : 568px) {
	.account-details>div, .personal-details>div {
		width: 50%;
	}
	label {
		width: 40%;
	}
	input {
		width: 60%;
	}
	select, .children, .gender, .bdate-block {
		width: calc(60% + 16px);
	}
}
</style>

		<div class="main-block">
			<form action="/student/create" method="POST">
				<h1>Créaction d'un étudiant</h1>
				<fieldset>
					<legend>
						<h3>Nom et prénom</h3>
					</legend>
					<div class="account-details">
						<div>
							<label>Nom en français</label><input type="text"
								name="last_name_fr" required>
						</div>
						<div>
							<label>Nom en arabe</label><input type="text" name="last_name_ar"
								required>
						</div>
						<div>
							<label>Prénom en français</label><input type="text"
								name="first_name_fr" required>
						</div>
						<div>
							<label>Prénom en arabe</label><input type="text"
								name="first_name_ar" required>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>
						<h3>Informations estudiantes</h3>
					</legend>
					<div class="personal-details">
						<div>
							<div>
								<label>Code massar</label><input type="text" name="massar_edu"
									required>
							</div>
							<div>
								<label>CNE</label><input type="text" name="cne" required>
							</div>
							<div>
								<label>Nationalité</label><jsp:include page="country-select.jsp"></jsp:include></div>
							<div>
								<label>Ville</label><input type="text" name="city" required>
							</div>
							<div>
								<label>Sexe</label>
								<div class="gender">
									Homme <input type="radio" value="HOMME" id="male" name="gender"
										required /><br> Femme <input type="radio" value="FEMME"
										id="female" name="gender" required /><br>
								</div>
							</div>
						</div>
						<div>
							<div>
								<label>Date de naissance</label><input type="date"
									name="birth_date">
							</div>

							<div>
								<label>Lieu de naissance</label><input type="text"
									name="birth_place">
							</div>

							<div>
								<label>Province</label><input type="text" name="province">
							</div>

							<div>
								<label>année du bac</label><input type="text" name="bac_year">
							</div>

							<div>
								<label>type du bac</label><input type="text" name="bac_type">
							</div>

							<div>
								<label>mention du bac</label><input type="text" name="mention">
							</div>

							<div>
								<label>lycée</label><input type="text" name="high_school">
							</div>

							<div>
								<label>lieu d'obtention du bac</label><input type="text"
									name="bac_place">
							</div>

							<div>
								<label>académie</label><input type="text" name="academy">
							</div>

							<div>
								<label>établissement</label><input type="text"
									name="establishment">
							</div>

						</div>

					</div>
				</fieldset>
				<button type="submit">Submit</button>
			</form>
		</div>














		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Création d'un étudiant</h5>
				<form class="">
					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="last_name_fr" class="">Nom en français</label><input
									name="last_name_fr" id="last_name_fr"
									placeholder="" type="text"
									class="form-control">
							</div>
						</div>
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="last_name_ar" class="">Nom en arabe</label><input
									name="last_name_ar" id="last_name_ar"
									placeholder="" type="text"
									class="form-control">
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="first_name_fr" class="">Prénom en français</label><input
									name="first_name_fr" id="first_name_fr"
									placeholder="" type="text"
									class="form-control">
							</div>
						</div>
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="first_name_ar" class="">Prénom en arabe</label><input
									name="first_name_ar" id="first_name_ar"
									placeholder="" type="text"
									class="form-control">
							</div>
						</div>
					</div>
					<div class="position-relative form-group">
						<label for="exampleAddress" class="">Address</label><input
							name="address" id="exampleAddress" placeholder="1234 Main St"
							type="text" class="form-control">
					</div>
					<div class="position-relative form-group">
						<label for="exampleAddress2" class="">Address 2</label><input
							name="address2" id="exampleAddress2"
							placeholder="Apartment, studio, or floor" type="text"
							class="form-control">
					</div>
					<div class="form-row">
						<div class="col-md-6">
							<div class="position-relative form-group">
								<label for="exampleCity" class="">City</label><input name="city"
									id="exampleCity" type="text" class="form-control">
							</div>
						</div>
						<div class="col-md-4">
							<div class="position-relative form-group">
								<label for="exampleState" class="">State</label><input
									name="state" id="exampleState" type="text" class="form-control">
							</div>
						</div>
						<div class="col-md-2">
							<div class="position-relative form-group">
								<label for="exampleZip" class="">Zip</label><input name="zip"
									id="exampleZip" type="text" class="form-control">
							</div>
						</div>
					</div>
					<div class="position-relative form-check">
						<input name="check" id="exampleCheck" type="checkbox"
							class="form-check-input"><label for="exampleCheck"
							class="form-check-label">Check me out</label>
					</div>
					<button class="mt-2 btn btn-primary">Sign in</button>
				</form>
			</div>
		</div>


















	</layout:put>
</layout:extends>