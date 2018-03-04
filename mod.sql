--
-- MODULE MENU SQL

CREATE TABLE IF NOT EXISTS `module_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(25) NOT NULL DEFAULT '0',
  `menu_cat` varchar(10) NOT NULL DEFAULT '',
  `menu_title` varchar(30) NOT NULL DEFAULT '',
  `menu_rank` int(11) NOT NULL DEFAULT '0',
  `menu_visible` char(1) NOT NULL DEFAULT 'Y',
  `menu_action` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`menu_id`,`module_id`),
  UNIQUE KEY `ukey_modulemenu` (`module_id`,`menu_action`),
  KEY `key_module` (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1383 ;

--
-- Dumping data for table `module_menu`
--

INSERT INTO `module_menu` (`menu_id`, `module_id`, `menu_cat`, `menu_title`, `menu_rank`, `menu_visible`, `menu_action`) VALUES
(1382, 'phie', 'REPORTS', 'PHIE Sync', 1382, 'Y', '_phie');


--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `module_id` varchar(25) NOT NULL DEFAULT '',
  `module_init` char(1) NOT NULL DEFAULT 'N',
  `module_version` varchar(25) DEFAULT '',
  `module_desc` text NOT NULL,
  `module_author` varchar(50) NOT NULL DEFAULT '',
  `module_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `ukey_modules` (`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`module_id`, `module_init`, `module_version`, `module_desc`, `module_author`, `module_name`) VALUES
('phie', 'Y', '0.1-2016-12-01', 'WAH - PHIE Sync', 'Emmanuel B. Perez', 'phie');

--
-- Table structure for table `phie_response`
--

CREATE TABLE IF NOT EXISTS `phie_response` (
  `patient_id` varchar(255) NOT NULL,
  `consult_id` varchar(255) NOT NULL,
  `data_type` varchar(50) NOT NULL,
  `response_code` int(5) NOT NULL,
  `response_desc` varchar(255) NOT NULL,
  `response_date` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `doh_id` varchar(255) NOT NULL,
  `error_desc` varchar(255) NOT NULL,
  `phie_sync` set('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- DROP TABLES
--
drop table m_lib_civil_status;
drop table m_lib_vaccine

--
-- Table structure for table `m_lib_civil_status`
--

CREATE TABLE IF NOT EXISTS `m_lib_civil_status` (
  `status_id` varchar(10) NOT NULL,
  `phie_id` varchar(2) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_lib_civil_status`
--

INSERT INTO `m_lib_civil_status` (`status_id`, `phie_id`, `status_name`) VALUES
('SNGL', 'S', 'Single'),
('MRRD', 'M', 'Married'),
('ANLD', 'A', 'Annuled'),
('WDWD', 'W', 'Widowed'),
('SPRTD', 'X', 'Separated'),
('COHAB', 'C', 'Co-Habitation'),
('DVRCD', 'D', 'Divorced');


--
-- Table structure for table `m_lib_vaccine`
--

CREATE TABLE IF NOT EXISTS `m_lib_vaccine` (
  `vaccine_id` varchar(25) NOT NULL DEFAULT '',
  `vaccine_name` varchar(50) NOT NULL DEFAULT '',
  `vaccine_interval` int(11) NOT NULL DEFAULT '0',
  `vaccine_required` char(1) NOT NULL DEFAULT 'N',
  `vaccine_desc` text NOT NULL,
  `immunization_code` varchar(10) NOT NULL,
  PRIMARY KEY (`vaccine_id`),
  UNIQUE KEY `ukey_vaccinename` (`vaccine_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_lib_vaccine`
--

INSERT INTO `m_lib_vaccine` (`vaccine_id`, `vaccine_name`, `vaccine_interval`, `vaccine_required`, `vaccine_desc`, `immunization_code`) VALUES
('BCG', 'BCG Vaccine', 1, 'Y', 'BCG Vaccine', '90585'),
('CPV', 'Varicella Vaccine', 0, 'N', 'Varicella (Chickenpox) Vaccine', '90716'),
('DPT1', 'DPT1 Vaccine', 6, 'Y', 'DPT Vaccine', ''),
('DPT2', 'DPT2 Vaccine', 10, 'Y', 'DPT Vaccine', ''),
('DPT3', 'DPT3 Vaccine', 14, 'Y', 'DPT Vaccine', ''),
('FLU', 'Flu Vaccine', 0, 'N', 'Flu Vaccine', ''),
('HEPB', 'Hepa at Birth', 0, 'N', '', ''),
('HEPB1', 'Hepatitis B1 Vaccine', 6, 'N', 'Hepatitis B Vaccine', ''),
('HEPB2', 'Hepatitis B2 Vaccine', 10, 'N', 'Hepatitis B Vaccine', ''),
('HEPB3', 'Hepatitis B3 Vaccine', 14, 'N', 'Hepatitis B Vaccine', ''),
('HPV', 'HPV Vaccine', 0, 'N', 'Human Papilloma Virus Vaccine', '90649'),
('IPV', 'Inactivated Polio Vaccine', 0, 'N', 'Inactivated Polio Vaccine', '90713'),
('MMR', 'Measles, Mumps, Rubella (MMR)', 0, 'N', '', '90707'),
('MSL', 'Measles Vaccine', 36, 'Y', 'Measles Vaccine', '90705'),
('OPV1', 'OPV1 Vaccine', 6, 'Y', 'Oral Polio Vaccine', '90712'),
('OPV2', 'OPV2 Vaccine', 10, 'Y', 'Oral Polio Vaccine', '90712'),
('OPV3', 'OPV3 Vaccine', 14, 'Y', 'Oral Polio Vaccine', '90712'),
('PCV1', 'PCV 1', 0, 'N', 'Pneumococal Conjugate Antigen 1st dose', ''),
('PCV2', 'PCV 2', 0, 'N', 'Pneumococal Conjugate Antigen 2nd dose', ''),
('PCV3', 'PCV 3', 0, 'N', 'Pneumococal Conjugate Antigen 3rd dose', ''),
('PENTA1', 'Pentavalent 1', 6, 'Y', 'Pentavalent 1 (5 in 1)', '90680'),
('PENTA2', 'Pentavalent 2', 10, 'Y', 'Pentavalent 2 (5 in 1)', '90680'),
('PENTA3', 'Pentavalent 3', 14, 'Y', 'Pentavalent 3 (5 in 1)', '90680'),
('ROTA', 'Rotavirus Vaccine', 0, 'N', 'Rotavirus Vaccine', '90681'),
('ROTA2', 'Rotavirus 2', 0, 'N', '', '90681'),
('ROTA3', 'Rotavirus 3', 0, 'N', 'Rotavirus 3', '90681'),
('TT1', 'TT1 Vaccine', 0, 'Y', 'Tetanus Toxoid 1', '90703'),
('TT2', 'TT2 Vaccine', 0, 'Y', 'Tetanus Toxoid 2', '90703'),
('TT3', 'TT3 Vaccine', 0, 'Y', 'Tetanus Toxoid 3', '90703'),
('TT4', 'TT4 Vaccine', 0, 'Y', 'Tetanus Toxoid 4', '90703'),
('TT5', 'TT5 Vaccine', 0, 'Y', 'Tetanus Toxoid 5', '90703');

--
-- ADD COLUMN PHIESYNC
ALTER TABLE `m_patient_philhealth` ADD `phie_sync` SET("Y","N") NOT NULL DEFAULT 'N';
ALTER TABLE `m_patient_philhealth` CHANGE `philhealth_timestamp` `philhealth_timestamp` DATETIME NOT NULL;

--
-- EDI M_LIB_BARANGAY
ALTER TABLE `m_lib_barangay` ADD `brgy_id` VARCHAR(11);
UPDATE `m_lib_barangay` SET `brgy_id` = `barangay_id`;

UPDATE m_lib_barangay SET brgy_id=concat(0,brgy_id);
