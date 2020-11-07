<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://kwonnam.pe.kr/jsp/template-inheritance"
	prefix="layout"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<layout:extends name="layout.jsp">
	<layout:put block="content" type="REPLACE">

		<div class="main-card mb-3 card">
			<div class="card-shadow-primary border mb-3 card card-body border-primary">
			<h5 class="card-title" style="margin-left:350px">Etudiant : ${Inscription.getFirst_name_fr()} ${Inscription.getLast_name_fr()}</h5>
			<ul class="list-group">
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Academy : </div>
                                                                    <div class="widget-subheading">${Inscription.getAcademy()}</div>
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Place de bac :</div>
                                                                    <div class="widget-subheading">${Inscription.getBac_place()}</div>
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Type de bac :</div>
                                                                    <div class="widget-subheading">${Inscription.getBac_type()}</div>
                                                                </div>
                                                               
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Date d'inscription :</div>
                                                                    <div class="widget-subheading">${Inscription.getRegistration_date()}</div>
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Date de naissance :</div>
                                                                    <div class="widget-subheading">${Inscription.getBirth_date()}</div>
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Ville de naissance :</div>
                                                                    <div class="widget-subheading">${Inscription.getBirth_place()}</div>
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Ville :</div>
                                                                    <div class="widget-subheading">${Inscription.getCity()}</div>
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">CNE :</div>
                                                                    <div class="widget-subheading">${Inscription.getCne()}</div>
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Etablissement :</div>
                                                                    <div class="widget-subheading">${Inscription.getEstablishment()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Nom en arabe :</div>
                                                                    <div class="widget-subheading">${Inscription.getLast_name_ar()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Nom en francais :</div>
                                                                    <div class="widget-subheading">${Inscription.getLast_name_fr()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Prenom en arabe :</div>
                                                                    <div class="widget-subheading">${Inscription.getFirst_name_ar()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Prenom en francais :</div>
                                                                    <div class="widget-subheading">${Inscription.getFirst_name_fr()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Sexe :</div>
                                                                    <div class="widget-subheading">${Inscription.getGender()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Nom lycée :</div>
                                                                    <div class="widget-subheading">${Inscription.getHigh_school()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                 <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Num Massar :</div>
                                                                    <div class="widget-subheading">${Inscription.getMassar_edu()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                
                                                 <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Mention :</div>
                                                                    <div class="widget-subheading">${Inscription.getMention()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="widget-content p-0">
                                                        <div class="widget-content-outer">
                                                            <div class="widget-content-wrapper">
                                                                <div class="widget-content-left">
                                                                    <div class="widget-heading">Nationalité :</div>
                                                                    <div class="widget-subheading">${Inscription.getNationality()}</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                            <c:if test="${Inscription.accepted==0}">
				<a style="color: black;margin-top:20px;margin-left:350px;"><button class="mb-2 mr-2 border-0 btn-transition btn btn-success" style="font-size: 18px" onclick="window.location='/student/AccepterInscriptionEnLigne?idie=${Inscription.getId()}'">Accepter
                                        </button>
                                        <button class="mb-2 mr-2 border-0 btn-transition btn btn-danger" style="font-size: 18px" onclick="window.location='/student/RefuserInscriptionEnLigne?idie=${Inscription.getId()}'">Refuser
                                        </button></a>   
                                        </c:if>                   
			</div>
		</div>

	</layout:put>
</layout:extends>