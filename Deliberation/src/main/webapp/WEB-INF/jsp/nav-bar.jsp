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
				<li><a href="index.html" class="mm-active"> <i
						class="metismenu-icon pe-7s-rocket"></i> Tableau de bords
				</a></li>
				<li>
					<a href="#"> <i class="metismenu-icon pe-7s-diamond"></i>
						Menu <i
						class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
				</a>
					<ul>
						<li><a href="/student/create"> <i
								class="metismenu-icon"></i> Ajouter un étudiant
						</a></li>
						<li><a href="/student/list"> <i
								class="metismenu-icon"> </i>Liste des étudiants
						</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>