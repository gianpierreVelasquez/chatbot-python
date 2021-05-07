CREATE DATABASE IF NOT EXISTS UNIVERSITIES;
 
USE UNIVERSITIES;

CREATE TABLE U_SAN_MARCOS
(
	tag varchar(500),
    patterns varchar(5000),
    responses varchar(5000)
);

CREATE TABLE U_INGENIERIA
(
	tag varchar(500),
    patterns varchar(5000),
    responses varchar(5000)
);

CREATE TABLE U_AGRARIA
(
	tag varchar(500),
    patterns varchar(5000),
    responses varchar(5000)
);

CREATE TABLE U_VILLAREAL
(
	tag varchar(500),
    patterns varchar(5000),
    responses varchar(5000)
);

CREATE TABLE U_CALLAO
(
	tag varchar(500),
    patterns varchar(5000),
    responses varchar(5000)
);

## SAN MARCOS ##
INSERT INTO u_san_marcos (tag, patterns, responses) VALUES ("u_san_marcos_fechas", "fechas", "EXAMEN ESPECIAL: (Graduados o titulados, Traslado externo nacional e internacional, Traslado interno, Deportistas calificados de alto nivel y Deportistas calificados)
Fecha: sábado, 17 de abril de 2021. Todas las áreas: EXAMEN GENERAL: A: Ciencias de la salud, fecha: sábado, 24 de abril de 2021; B: Ciencias básicas y D: Ciencias económicas y de la gestión, fecha: domingo, 25 de abril de 2021; C: Ingeniería, fecha: sábado, 
1 de mayo del 2021; E: Humanidades y ciencias jurídicas y sociales, fecha: domingo, 2 de mayo del 2021");
INSERT INTO u_san_marcos (tag, patterns, responses) VALUES ("u_san_marcos_admision", "admision", "Se le enviará el Reglamento de Admisión a su correo, luego del pago realizado en el Banco de la Nación presencial o virtualmente.
Pague el derecho de inscripción en el Banco de la Nación digitando 100000 + el DNI del postulante. Los montos son los siguientes: Cuenta 9501 – Institución Educativa Pública – S/ 350.00, Cuenta 9502 – Institución Educativa Privada – S/ 500.00
Esperar 6 horas e ingresar a la página www.admision.unmsm.edu.pe e inicie su inscripción digitando la información solicitada.");
INSERT INTO u_san_marcos (tag, patterns, responses) VALUES ("u_san_marcos_simulacro", "simulacro", "Costo: S./10.00, el concepto de pago: 9518 en Banco de la nación *El pago se efectúa a través de la plataforma Multired Virtual, usando el token, o en sus diferentes
agencias. Rendir el simulacro virtual en este enlace https://appadmision.unmsm.edu.pe/app/virtual/views/form01.php");
INSERT INTO u_san_marcos (tag, patterns, responses) VALUES ("u_san_marcos_reglas", "reglas", "1. Pagos en el Banco de la Nación: - Virtual: Págalo.pe / cuenta: 9520 / monto: S/ 50.00, - Presencial en agencia / cuenta: 9516 / monto S/ 50.00. 
2. Después de 6 horas, ingresar a www.admision.unmsm.edu.pe. 3. Digitar: - Código de operación generada por el banco, -DNI del postulante, -Correo electrónico del postulante. 4. Se enviará el Reglamento de Admisión 2021 por correo electrónico.");
INSERT INTO u_san_marcos (tag, patterns, responses) VALUES ("u_san_marcos_costos", "costos", "1. Se le enviará el Reglamento de Admisión a su correo, luego del pago realizado en el Banco de la Nación presencial o virtualmente.
2. Pague el derecho de inscripción en el Banco de la Nación digitando 100000 + el DNI del postulante. 3. Los montos son los siguientes: -Cuenta 9501 – Institución Educativa Pública – S/ 350.00, -Cuenta 9502 – Institución Educativa Privada – S/ 500.00. 
4. Esperar 6 horas e ingresar a la página www.admision.unmsm.edu.pe e inicie su inscripción digitando la información solicitada. 5. Verificar los datos ofrecidos y haga click en la opción Registrar Inscripción.");

select * from u_san_marcos;

## UNI ##
INSERT INTO u_ingenieria (tag, patterns, responses) VALUES ("u_ingenieria_fechas", "fechas", "Para poder ver el calendario del proceso de admisión ingresar al siguiente link : http://www.admision.uni.edu.pe/admision/cronograma");
INSERT INTO u_ingenieria (tag, patterns, responses) VALUES ("u_ingenieria_admision", "admision", "La inscripción al Concurso de Admisión se realiza por Internet en la página web http://www.admision.uni.edu.pe, según el procedimiento 
señalado en la Guía de Inscripción y de acuerdo al calendario de Inscripción. Luego de informarse, el postulante deberá Aceptar los Términos y Condiciones de postulación, por la cual declara bajo juramento contar con todos los 
documentos originales exigidos y así mismo se compromete a presentarlos en las fechas fijadas para la entrega de la Constancia de Ingreso, cuando le corresponda.");
INSERT INTO u_ingenieria (tag, patterns, responses) VALUES ("u_ingenieria_simulacro", "simulacro", "Si quiere conocer inscribirse en el simulacro del 
presente año, ingresar al siguiente enlace: http://www.admision.uni.edu.pe/simulacro-virtual-admision");
INSERT INTO u_ingenieria (tag, patterns, responses) VALUES ("u_ingenieria_reglas", "reglas", "Las reglas se detallen en el siguiente enlace : http://www.admision.uni.edu.pe/cepre-uni-virtual/requisitos");
INSERT INTO u_ingenieria (tag, patterns, responses) VALUES ("u_ingenieria_costos", "pagos", "Estimado postulante: Los pagos se realizarán en el Banco de Crédito del Perú, Formas de Pagos:
1. Acercándote al BANCO BCP, indica el nombre comercial, UNIVERSIDAD NACIONAL DE INGENIERÍA, Servicios de Admisión y el NÚMERO DE DNI DEL POSTULANTE.
2. En cualquier AGENTE BCP, indica el nombre comercial, UNIVERSIDAD NACIONAL DE INGENIERÍA, el código 15226, luego el SERVICIO DE ADMISIÓN  y el NÚMERO DE DNI DEL POSTULANTE.
3. Ingresando a BANCA POR INTERNET, www.viabcp.com, sección: Tus Cuentas / Pago de Servicios / Universidades / UNIVERSIDAD NACIONAL DE INGENIERÍA / Servicios de Admisión y luego digitar el NÚMERO DE DNI DEL POSTULANTE.");

select * from u_ingenieria;

## AGRARIA ##
INSERT INTO u_agraria (tag, patterns, responses) VALUES ("u_agraria_fechas", "fechas", "AMPLIACIÓN DE INSCRIPCIONES DEL 7 AL 9 DE MAYO (HASTA LAS 6:00 PM) EXAMEN DE ADMISIÓN VIRTUAL 23 DE MAYO");
INSERT INTO u_agraria (tag, patterns, responses) VALUES ("u_agraria_admision", "admision", "Para conocer más sobre el proceso de admisión ingresar aquí https://admision.lamolina.edu.pe/");
INSERT INTO u_agraria (tag, patterns, responses) VALUES ("u_agraria_simulacro", "simulacro", "LUNES 31 DE AGOSTO AL VIERNES 18 DE SETIEMBRE, Realizar el pago correspondiente, en el Banco de Crédito del Perú(BCP), el monto que debe abonar por 
Derecho de Inscripción al SIMULACRO VIRTUAL DEL EXAMEN DE ADMISIÓN, es: Todas las Modalidades S/.50.00; Al cabo de 60 minutos usted podrá VERIFICAR SU INSCRIPCIÓN.");
INSERT INTO u_agraria (tag, patterns, responses) VALUES ("u_agraria_reglas", "reglas", "Todo sobre el reglamento del proceso de admisión aquí : https://admision.lamolina.edu.pe/admisi%C3%B3n-2021-I");
INSERT INTO u_agraria (tag, patterns, responses) VALUES ("u_agraria_costos", "pagos", "Los pagos para postulante libre son los siguientes: Participantes Libre (GUÍA MÁS EXAMEN) S/180.00, GUIA DEL POSTULANTE S/83.00
Pago extemporáneo S/51.00 y para obtener más información sobre los pagos, ingresar a : https://admision.lamolina.edu.pe/pago-inscripcion");

select * from u_agraria;

## VILLAREAL ##
INSERT INTO u_villareal (tag, patterns, responses) VALUES ("u_villareal_fechas","fechas","Para conocer el cronograma de admisión, ingresar aquí: http://web2.unfv.edu.pe/admision/index.php/pregrado-servicios/cronograma");
INSERT INTO u_villareal (tag, patterns, responses) VALUES ("u_villareal_admision","admision","Para el proceso de admisión seguir las instrucciones del siguiente enlace: https://web2.unfv.edu.pe/admision/index.php/pregrado-servicios/instructivo-de-inscripciones-via-pagina-web");
INSERT INTO u_villareal (tag, patterns, responses) VALUES ("u_villareal_simulacro","simulacro","Para conocer el proceso de simulacro, ingresar al siguiente link -> https://web2.unfv.edu.pe/sitio/transparencia/portal-de-transparencia-estandar/actividades-oficiales/agenda-del-vicerrectorado-academico/2480-simulacro-de-examen-de-admision");
INSERT INTO u_villareal (tag, patterns, responses) VALUES ("u_villareal_reglas","reglas","En el siguiente link encontrara las normas y reglas del proceso de examen de admisión , link -> https://web2.unfv.edu.pe/sitio/transparencia_universitaria/documentos_gestion_reglamentos/reglamentos_universidad/reglamento_admision/reglamento_admision.pdf");
INSERT INTO u_villareal (tag, patterns, responses) VALUES ("u_villareal_pagos","pagos","El tarifario y pagos sobre el derecho de inscripción se detalla en el siguiente link -> https://web2.unfv.edu.pe/admision/index.php/pregrado-servicios/tarifario");

select * from u_villareal;

## CALLAO ##
INSERT INTO u_callao (tag, patterns, responses) VALUES ("u_callao_fechas","fechas","Conosca aquí todo sobre el cronograma para el proceso de admisión, ingrese aquí: http://admision.unac.edu.pe/cronograma.aspx");
INSERT INTO u_callao (tag, patterns, responses) VALUES ("u_callao_admision","admision","Proceso de admisión 2021-1, examen General de Admisión : BLOQUE  II Y III: 15 DE MAYO 2021 / BLOQUE I: 18 DE MAYO 2021, Para conocer el proceso de inscripción y más , ingresar aquí: http://admision.unac.edu.pe/");
INSERT INTO u_callao (tag, patterns, responses) VALUES ("u_callao_simulacro","simulacro","Para acceder al simulacro virtual, ingrese al siguiente link donde se le detallara los pasos a seguir, Aquí>> http://admision.unac.edu.pe/simulacroVirtual.aspx");
INSERT INTO u_callao (tag, patterns, responses) VALUES ("u_callao_reglas","reglas","Todo sobre las reglas del examen de admisión del presente año , link : http://admision.unac.edu.pe/documentos/reglamentoAdmision2021.pdf");
INSERT INTO u_callao (tag, patterns, responses) VALUES ("u_callao_pagos","pagos","El pago se realiza en el banco Scotiabank, para conocer más sobre el pago ingrese aquí: https://unac.edu.pe/pagos-en-l%C3%ADnea-unac.html");

select * from u_callao;