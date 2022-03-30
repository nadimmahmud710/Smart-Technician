-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2021 at 08:01 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myportfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_customer`
--

CREATE TABLE `accounts_customer` (
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  `house` varchar(20) NOT NULL,
  `flat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_customer`
--

INSERT INTO `accounts_customer` (`user_id`, `phone_number`, `location`, `house`, `flat`) VALUES
(1, '01234456543', 'Rampura, Banasree, B', 'h4', 'D3'),
(4, '01234456543', 'Rampura, Banasree, B', 'h4', 'D3');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_employee`
--

CREATE TABLE `accounts_employee` (
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `nid` varchar(20) NOT NULL,
  `workplace` varchar(20) NOT NULL,
  `job_field` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_employee`
--

INSERT INTO `accounts_employee` (`user_id`, `phone_number`, `nid`, `workplace`, `job_field`) VALUES
(2, '0178986554', '098763435625', 'bismillaah enginneer', 'AC mechanics'),
(3, '01521475695', '098763435625', 'bismillaah enginneer', 'AC mechanics');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_friend`
--

CREATE TABLE `accounts_friend` (
  `id` int(11) NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `from_user_a_id` int(11) NOT NULL,
  `post_Id_a_id` int(11) NOT NULL,
  `to_user_a_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_friend`
--

INSERT INTO `accounts_friend` (`id`, `date_posted`, `from_user_a_id`, `post_Id_a_id`, `to_user_a_id`) VALUES
(1, '2021-05-18 15:54:17.499277', 1, 2, 2),
(3, '2021-05-19 04:48:40.713025', 1, 3, 2),
(4, '2021-05-19 04:48:44.875680', 1, 1, 2),
(5, '2021-05-19 04:56:44.847223', 1, 1, 3),
(6, '2021-05-19 04:56:51.692426', 1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_friend_request`
--

CREATE TABLE `accounts_friend_request` (
  `id` int(11) NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `post_Id_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_friend_request`
--

INSERT INTO `accounts_friend_request` (`id`, `date_posted`, `from_user_id`, `post_Id_id`, `to_user_id`) VALUES
(1, '2021-05-18 15:51:08.917866', 2, 2, 1),
(2, '2021-05-19 04:29:42.468552', 2, 1, 1),
(3, '2021-05-19 04:47:58.372017', 2, 3, 1),
(4, '2021-05-19 04:56:20.224972', 3, 2, 1),
(5, '2021-05-19 04:56:25.097605', 3, 1, 1),
(6, '2021-05-19 05:37:49.483158', 2, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_post`
--

CREATE TABLE `accounts_post` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `job_field` varchar(100) NOT NULL,
  `problem_content` longtext NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_post`
--

INSERT INTO `accounts_post` (`id`, `title`, `job_field`, `problem_content`, `date_posted`, `author_id`) VALUES
(1, 'I need electrician', 'electrician', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th', '2021-05-18 15:44:28.886150', 1),
(2, 'I need a Ac mechanics', 'AC mechanics', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th', '2021-05-18 15:45:45.165965', 1),
(3, 'I need electrician', 'electrician', 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb', '2021-05-19 04:47:32.164393', 1),
(4, 'I need electrician', 'electrician', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts', '2021-05-19 05:23:47.748911', 4);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_review`
--

CREATE TABLE `accounts_review` (
  `id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `date_posted` datetime(6) NOT NULL,
  `like_id` int(11) NOT NULL,
  `post_Id_r_id` int(11) NOT NULL,
  `to_user_r_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_review`
--

INSERT INTO `accounts_review` (`id`, `rating`, `date_posted`, `like_id`, `post_Id_r_id`, `to_user_r_id`) VALUES
(2, 4, '2021-05-19 04:08:32.407125', 1, 2, 2),
(3, 3, '2021-05-19 04:46:53.578502', 1, 2, 2),
(4, 4, '2021-05-19 04:49:15.395680', 1, 1, 2),
(5, 4, '2021-05-19 04:57:45.117319', 1, 2, 3),
(6, 5, '2021-05-19 04:58:18.280097', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user`
--

CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_customer` tinyint(1) NOT NULL,
  `is_employee` tinyint(1) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_user`
--

INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `email`, `is_staff`, `is_active`, `date_joined`, `is_customer`, `is_employee`, `first_name`, `last_name`) VALUES
(1, 'pbkdf2_sha256$216000$gJroNBCBwhmG$hpEnFZcA21ZOiTs8ZwPydg9URB4qUn0rqHqrGzV62CE=', '2021-05-19 04:57:32.829356', 0, 'nadim112', '', 1, 1, '2021-05-18 15:42:44.447555', 1, 0, 'Nadim', 'Hridoy'),
(2, 'pbkdf2_sha256$216000$FdKFBiAgr8hw$wxc2vTEevKEZMmmFLI9Jylo1FfDPkqS7422+05t4WOs=', '2021-05-19 05:27:36.826284', 0, 'nadim4545', '', 1, 1, '2021-05-18 15:49:41.312747', 0, 1, 'Nadim', 'Hridoy'),
(3, 'pbkdf2_sha256$216000$PS6Xk0k0NzKs$b4wzQbrdYR9VPQ1Ipj+ZYn0/Ilw5LTnHsRzauDp4E+E=', '2021-05-19 04:57:06.500118', 0, 'test22', '', 1, 1, '2021-05-19 04:56:01.986293', 0, 1, 'Nadim', 'mahmud'),
(4, 'pbkdf2_sha256$216000$weClCia4dHPi$r7DOsCg66i9ES4J1uik/u/nYTsFTWESxgGb+UKpt5to=', '2021-05-19 05:22:49.053006', 0, 'Zain11', '', 1, 1, '2021-05-19 05:22:32.573798', 1, 0, 'Zainab', 'Azad');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_groups`
--

CREATE TABLE `accounts_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_user_permissions`
--

CREATE TABLE `accounts_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add post', 7, 'add_post'),
(26, 'Can change post', 7, 'change_post'),
(27, 'Can delete post', 7, 'delete_post'),
(28, 'Can view post', 7, 'view_post'),
(29, 'Can add customer', 8, 'add_customer'),
(30, 'Can change customer', 8, 'change_customer'),
(31, 'Can delete customer', 8, 'delete_customer'),
(32, 'Can view customer', 8, 'view_customer'),
(33, 'Can add employee', 9, 'add_employee'),
(34, 'Can change employee', 9, 'change_employee'),
(35, 'Can delete employee', 9, 'delete_employee'),
(36, 'Can view employee', 9, 'view_employee'),
(37, 'Can add review', 10, 'add_review'),
(38, 'Can change review', 10, 'change_review'),
(39, 'Can delete review', 10, 'delete_review'),
(40, 'Can view review', 10, 'view_review'),
(41, 'Can add friend_ request', 11, 'add_friend_request'),
(42, 'Can change friend_ request', 11, 'change_friend_request'),
(43, 'Can delete friend_ request', 11, 'delete_friend_request'),
(44, 'Can view friend_ request', 11, 'view_friend_request'),
(45, 'Can add friend', 12, 'add_friend'),
(46, 'Can change friend', 12, 'change_friend'),
(47, 'Can delete friend', 12, 'delete_friend'),
(48, 'Can view friend', 12, 'view_friend');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'accounts', 'customer'),
(9, 'accounts', 'employee'),
(12, 'accounts', 'friend'),
(11, 'accounts', 'friend_request'),
(7, 'accounts', 'post'),
(10, 'accounts', 'review'),
(6, 'accounts', 'user'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-05-18 15:40:14.693476'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-05-18 15:40:16.351915'),
(3, 'auth', '0001_initial', '2021-05-18 15:40:17.919887'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-05-18 15:40:22.061967'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-05-18 15:40:22.133261'),
(6, 'auth', '0004_alter_user_username_opts', '2021-05-18 15:40:22.174076'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-05-18 15:40:22.369559'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-05-18 15:40:22.619630'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-05-18 15:40:22.869534'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-05-18 15:40:22.932028'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-05-18 15:40:22.978901'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-05-18 15:40:23.161957'),
(13, 'auth', '0011_update_proxy_permissions', '2021-05-18 15:40:23.224428'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2021-05-18 15:40:23.271327'),
(15, 'accounts', '0001_initial', '2021-05-18 15:40:27.091082'),
(16, 'admin', '0001_initial', '2021-05-18 15:40:46.626046'),
(17, 'admin', '0002_logentry_remove_auto_add', '2021-05-18 15:40:50.620681'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2021-05-18 15:40:50.710371'),
(19, 'sessions', '0001_initial', '2021-05-18 15:40:51.791696'),
(20, 'accounts', '0002_auto_20210519_0812', '2021-05-19 02:13:06.702859');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('fegksb4ipveeg7pwcli6cqzi2evitbae', '.eJxVjEEOwiAQAP_C2ZCyCIJH730DWXa3UjU0Ke3J-HdD0oNeZybzVgn3raS9yZpmVlcF6vTLMtJTahf8wHpfNC11W-ese6IP2_S4sLxuR_s3KNhK31rgy0RGog1IzNYjgYgFAM-BzyEMTqJ3JubokHykzI4H8ZMTZ3xWny_vrDhB:1ljEk4:b7fWM_zFQPfkI4bGXskuvjIdGVYK18WKTvl2djd8vzU', '2021-06-02 05:27:36.842353');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_customer`
--
ALTER TABLE `accounts_customer`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `accounts_employee`
--
ALTER TABLE `accounts_employee`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `accounts_friend`
--
ALTER TABLE `accounts_friend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_friend_from_user_a_id_d450820c_fk_accounts_user_id` (`from_user_a_id`),
  ADD KEY `accounts_friend_post_Id_a_id_38debcae_fk_accounts_post_id` (`post_Id_a_id`),
  ADD KEY `accounts_friend_to_user_a_id_ad6e8514_fk_accounts_user_id` (`to_user_a_id`);

--
-- Indexes for table `accounts_friend_request`
--
ALTER TABLE `accounts_friend_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_friend_requ_from_user_id_670b24ca_fk_accounts_` (`from_user_id`),
  ADD KEY `accounts_friend_request_post_Id_id_f30e5c63_fk_accounts_post_id` (`post_Id_id`),
  ADD KEY `accounts_friend_request_to_user_id_42957354_fk_accounts_user_id` (`to_user_id`);

--
-- Indexes for table `accounts_post`
--
ALTER TABLE `accounts_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_post_author_id_e63fc71d_fk_accounts_user_id` (`author_id`);

--
-- Indexes for table `accounts_review`
--
ALTER TABLE `accounts_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_review_like_id_1777007c_fk_accounts_user_id` (`like_id`),
  ADD KEY `accounts_review_post_Id_r_id_1513563f_fk_accounts_post_id` (`post_Id_r_id`),
  ADD KEY `accounts_review_to_user_r_id_17ef1bad_fk_accounts_user_id` (`to_user_r_id`);

--
-- Indexes for table `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  ADD KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  ADD KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_friend`
--
ALTER TABLE `accounts_friend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `accounts_friend_request`
--
ALTER TABLE `accounts_friend_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `accounts_post`
--
ALTER TABLE `accounts_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `accounts_review`
--
ALTER TABLE `accounts_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_customer`
--
ALTER TABLE `accounts_customer`
  ADD CONSTRAINT `accounts_customer_user_id_11606857_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_employee`
--
ALTER TABLE `accounts_employee`
  ADD CONSTRAINT `accounts_employee_user_id_593173d8_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_friend`
--
ALTER TABLE `accounts_friend`
  ADD CONSTRAINT `accounts_friend_from_user_a_id_d450820c_fk_accounts_user_id` FOREIGN KEY (`from_user_a_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `accounts_friend_post_Id_a_id_38debcae_fk_accounts_post_id` FOREIGN KEY (`post_Id_a_id`) REFERENCES `accounts_post` (`id`),
  ADD CONSTRAINT `accounts_friend_to_user_a_id_ad6e8514_fk_accounts_user_id` FOREIGN KEY (`to_user_a_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_friend_request`
--
ALTER TABLE `accounts_friend_request`
  ADD CONSTRAINT `accounts_friend_requ_from_user_id_670b24ca_fk_accounts_` FOREIGN KEY (`from_user_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `accounts_friend_request_post_Id_id_f30e5c63_fk_accounts_post_id` FOREIGN KEY (`post_Id_id`) REFERENCES `accounts_post` (`id`),
  ADD CONSTRAINT `accounts_friend_request_to_user_id_42957354_fk_accounts_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_post`
--
ALTER TABLE `accounts_post`
  ADD CONSTRAINT `accounts_post_author_id_e63fc71d_fk_accounts_user_id` FOREIGN KEY (`author_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_review`
--
ALTER TABLE `accounts_review`
  ADD CONSTRAINT `accounts_review_like_id_1777007c_fk_accounts_user_id` FOREIGN KEY (`like_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `accounts_review_post_Id_r_id_1513563f_fk_accounts_post_id` FOREIGN KEY (`post_Id_r_id`) REFERENCES `accounts_post` (`id`),
  ADD CONSTRAINT `accounts_review_to_user_r_id_17ef1bad_fk_accounts_user_id` FOREIGN KEY (`to_user_r_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
