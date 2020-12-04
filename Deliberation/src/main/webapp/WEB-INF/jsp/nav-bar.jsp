<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="app-sidebar sidebar-shadow">
	<div class="app-header__logo">
		<div class="logo-src"></div>
		<div class="header__pane ml-auto">
			<div>
				<button type="button"
					class="hamburger close-sidebar-btn hamburger--elastic"
					data-class="closed-sidebar">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
	</div>
	<div class="app-header__mobile-menu">
		<div>
			<button type="button"
				class="hamburger hamburger--elastic mobile-toggle-nav">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</button>
		</div>
	</div>
	<div class="app-header__menu">
		<span>
			<button type="button"
				class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
				<span class="btn-icon-wrapper"> <i
					class="fa fa-ellipsis-v fa-w-6"></i>
				</span>
			</button>
		</span>
	</div>
	<div class="scrollbar-sidebar">
		<div class="app-sidebar__inner">
			<ul class="vertical-nav-menu">
				<li class="app-sidebar__heading">Accueil</li>
				<li><a href="/" class="${dashboard}"> <i
						class="metismenu-icon pe-7s-rocket"></i> Tableau de bords
				</a></li>
				<li><a href="/student/create" class="${createStudent}"> <i
						class="metismenu-icon pe-7s-plus"></i> Ajouter un étudiant
				</a></li>
				<li><a href="/student/list" class="${listStudent}"> <i
						class="metismenu-icon pe-7s-menu"></i> Liste des étudiants
				</a></li>
				<li><a href="/student/InscriptionEnLigne" class="${InscriptionEnLigne}"> <i
						class="metismenu-icon pe-7s-plus"></i> Inscription En ligne
				</a></li>
				<li><a href="/student/ListInscriptionEnligne" class="${listInscriptions}"> <i
						class="metismenu-icon pe-7s-menu"></i>Liste des inscriptions en ligne
				</a></li>
				<li><a href="/inscription/InscriptionAdministrative" class="${InscriptionAdministrative}"> <i
						class="metismenu-icon pe-7s-plus"></i> Inscription Administrative
				</a></li>
				<li><a href="/inscription/ListInscriptionAdministrative" class="${listAdministartive}"> <i
						class="metismenu-icon pe-7s-menu"></i> Listes Inscriptions Administratives
				</a></li>
				<li><a href="/inscription/MenuPedagogique" class="${InscriptionPedagogique}"> <i
						class="metismenu-icon pe-7s-plus"></i>Inscriptions Pédagogique
				</a></li>
				<li><a href="/inscription/menuListPedagogique" class="${listPedagogique}"> <i
						class="metismenu-icon pe-7s-menu"></i> Listes Inscriptions Pedagogique
				</a></li>
				<li><a href="/inscription/StructureEnseignement" class="${StructureEnseignement}"> <i
						class="metismenu-icon pe-7s-menu"></i> Structure d'Enseignement
				</a></li>
			</ul>
		</div>
	</div>
</div>