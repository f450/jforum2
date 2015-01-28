--
-- Table structure for table 'jforum_banlist'
--
DROP TABLE IF EXISTS jforum_banlist;
CREATE TABLE jforum_banlist (
  banlist_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  user_id INT,
  banlist_ip VARCHAR(15),
  banlist_email VARCHAR(255),
  PRIMARY KEY (banlist_id)
);
CREATE INDEX idx_banlist_user ON jforum_banlist(user_id);
CREATE INDEX idx_banlist_ip ON jforum_banlist(banlist_ip);
CREATE INDEX idx_banlist_email ON jforum_banlist(banlist_email);

--
-- Table structure for table 'jforum_categories'
--
DROP TABLE IF EXISTS jforum_categories;
CREATE TABLE jforum_categories (
  categories_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  title VARCHAR(100) DEFAULT '' NOT NULL ,
  display_order INT DEFAULT 0 NOT NULL,
  moderated INT DEFAULT 0,
  PRIMARY KEY (categories_id)
);

--
-- Table structure for table 'jforum_config'
--
DROP TABLE IF EXISTS jforum_config;
CREATE TABLE jforum_config (
  config_name VARCHAR(255) DEFAULT '' NOT NULL,
  config_value VARCHAR(255) DEFAULT '' NOT NULL,
  config_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  PRIMARY KEY (config_id)
);

--
-- Table structure for table 'jforum_forums'
--
DROP TABLE IF EXISTS jforum_forums;
CREATE TABLE jforum_forums (
  forum_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  categories_id INT DEFAULT 1 NOT NULL,
  forum_name VARCHAR(150) DEFAULT '' NOT NULL,
  forum_desc VARCHAR(255) DEFAULT NULL,
  forum_order INT DEFAULT 1,
  forum_topics INT DEFAULT 0 NOT NULL,
  forum_last_post_id INT DEFAULT 0 NOT NULL,
  moderated INT DEFAULT 0,
  PRIMARY KEY (forum_id)
);
CREATE INDEX idx_forums_categories_id ON jforum_forums(categories_id);

--
-- Table structure for table 'jforum_forums_watch'
--
DROP TABLE IF EXISTS jforum_forums_watch;
CREATE TABLE jforum_forums_watch (
  forum_id INT NOT NULL,
  user_id INT NOT NULL,
  is_read INT DEFAULT 1
);
CREATE INDEX idx_fw_forum ON jforum_forums_watch(forum_id);
CREATE INDEX idx_fw_user ON jforum_forums_watch(user_id);

--
-- Table structure for table 'jforum_groups'
--
DROP TABLE IF EXISTS jforum_groups;
CREATE TABLE jforum_groups (
  group_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  group_name VARCHAR(40) DEFAULT '' NOT NULL,
  group_description VARCHAR(255) DEFAULT NULL,
  parent_id INT DEFAULT 0,
  PRIMARY KEY (group_id)
);

--
-- Table structure for table 'jforum_user_groups'
--
DROP TABLE IF EXISTS jforum_user_groups;
CREATE TABLE jforum_user_groups (
  group_id INT NOT NULL,
  user_id INT NOT NULL
);
CREATE INDEX idx_ug_group ON jforum_user_groups(group_id);
CREATE INDEX idx_ug_user ON jforum_user_groups(user_id);

--
-- Table structure for table 'jforum_roles'
--
DROP TABLE IF EXISTS jforum_roles;
CREATE TABLE jforum_roles (
  role_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  group_id INT DEFAULT 0,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (role_id)
);
CREATE INDEX idx_roles_group ON jforum_roles(group_id);
CREATE INDEX idx_roles_name ON jforum_roles(name);

--
-- Table structure for table 'jforum_role_values'
--
DROP TABLE IF EXISTS jforum_role_values;
CREATE TABLE jforum_role_values (
  role_id INT NOT NULL,
  role_value VARCHAR(255)
);
CREATE INDEX idx_rv_role ON jforum_role_values(role_id);

--
-- Table structure for table 'jforum_posts'
--
DROP TABLE IF EXISTS jforum_posts;
CREATE TABLE jforum_posts (
  post_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  topic_id INT DEFAULT 0 NOT NULL,
  forum_id INT DEFAULT 0 NOT NULL,
  user_id INT DEFAULT 0 NOT NULL,
  post_time TIMESTAMP DEFAULT NULL,
  poster_ip VARCHAR(15) DEFAULT NULL,
  enable_bbcode INT DEFAULT 1 NOT NULL,
  enable_html INT DEFAULT 1 NOT NULL,
  enable_smilies INT DEFAULT 1 NOT NULL,
  enable_sig INT DEFAULT 1 NOT NULL,
  post_edit_time TIMESTAMP DEFAULT NULL,
  post_edit_count INT DEFAULT 0 NOT NULL,
  status INT DEFAULT 1,
  attach INT DEFAULT 0,
  need_moderate INT DEFAULT 0,
  PRIMARY KEY (post_id)
);
CREATE INDEX idx_posts_user ON jforum_posts(user_id);
CREATE INDEX idx_posts_topic ON jforum_posts(topic_id);
CREATE INDEX idx_posts_moderate ON jforum_posts(forum_id);
CREATE INDEX idx_posts_time ON jforum_posts(post_time);
CREATE INDEX idx_posts_forum ON jforum_posts(need_moderate);

--
-- Table structure for table 'jforum_posts_text'
--
DROP TABLE IF EXISTS jforum_posts_text;
CREATE TABLE jforum_posts_text (
  post_id INT NOT NULL PRIMARY KEY,
  post_text LONGVARCHAR,
  post_subject VARCHAR(130)
);

--
-- Table structure for table 'jforum_privmsgs'
--
DROP TABLE IF EXISTS jforum_privmsgs;
CREATE TABLE jforum_privmsgs (
  privmsgs_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  privmsgs_type INT DEFAULT 0 NOT NULL,
  privmsgs_subject VARCHAR(255) DEFAULT '' NOT NULL,
  privmsgs_from_userid INT DEFAULT 0 NOT NULL,
  privmsgs_to_userid INT DEFAULT 0 NOT NULL,
  privmsgs_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  privmsgs_ip VARCHAR(15) DEFAULT '' NOT NULL,
  privmsgs_enable_bbcode INT DEFAULT 1 NOT NULL,
  privmsgs_enable_html INT DEFAULT 0 NOT NULL,
  privmsgs_enable_smilies INT DEFAULT 1 NOT NULL,
  privmsgs_attach_sig INT DEFAULT 1 NOT NULL,
  PRIMARY KEY (privmsgs_id)
);

--
-- Table structure for table 'jforum_privmsgs_text'
--
DROP TABLE IF EXISTS jforum_privmsgs_text;
CREATE TABLE jforum_privmsgs_text (
  privmsgs_id INT NOT NULL,
  privmsgs_text LONGVARCHAR,
  PRIMARY KEY (privmsgs_id)
);

--
-- Table structure for table 'jforum_ranks'
--

DROP TABLE IF EXISTS jforum_ranks;
CREATE TABLE jforum_ranks (
  rank_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  rank_title VARCHAR(50) DEFAULT '' NOT NULL,
  rank_min INT DEFAULT 0 NOT NULL,
  rank_special INT DEFAULT NULL,
  rank_image VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (rank_id)
);

--
-- Table structure for table 'jforum_sessions'
--
DROP TABLE IF EXISTS jforum_sessions;
CREATE TABLE jforum_sessions (
  session_id VARCHAR(150) DEFAULT '' NOT NULL,
  session_user_id INT DEFAULT 0 NOT NULL,
  session_start TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  session_time INT DEFAULT 0 NOT NULL,
  session_ip VARCHAR(15) DEFAULT '' NOT NULL,
  session_page INT DEFAULT 0 NOT NULL,
  session_logged_int INT DEFAULT NULL
);
CREATE INDEX idx_sess_user ON jforum_sessions(session_user_id);

--
-- Table structure for table 'jforum_smilies'
--
DROP TABLE IF EXISTS jforum_smilies;
CREATE TABLE jforum_smilies (
  smilie_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  code VARCHAR(50) DEFAULT '' NOT NULL ,
  url VARCHAR(100) DEFAULT NULL,
  disk_name VARCHAR(255),
  PRIMARY KEY (smilie_id)
);

--
-- Table structure for table 'jforum_themes'
--
DROP TABLE IF EXISTS jforum_themes;
CREATE TABLE jforum_themes (
  themes_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  template_name VARCHAR(30) DEFAULT '' NOT NULL,
  style_name VARCHAR(30) DEFAULT '' NOT NULL,
  PRIMARY KEY (themes_id)
);

--
-- Table structure for table 'jforum_topics'
--
DROP TABLE IF EXISTS jforum_topics;
CREATE TABLE jforum_topics (
  topic_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  forum_id INT DEFAULT 0 NOT NULL,
  topic_title VARCHAR(120) DEFAULT '' NOT NULL,
  user_id INT DEFAULT 0 NOT NULL,
  topic_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  topic_views INT DEFAULT 0,
  topic_replies INT DEFAULT 0,
  topic_status INT DEFAULT 0,
  topic_vote_id INT DEFAULT 0,
  topic_type INT DEFAULT 0,
  topic_first_post_id INT DEFAULT 0,
  topic_last_post_id INT DEFAULT 0 NOT NULL,
  topic_moved_id INT DEFAULT 0,
  moderated INT DEFAULT 0,
  PRIMARY KEY (topic_id)
);
CREATE INDEX idx_topics_forum ON jforum_topics(forum_id);
CREATE INDEX idx_topics_user ON jforum_topics(user_id);
CREATE INDEX idx_topics_fp ON jforum_topics(topic_first_post_id);
CREATE INDEX idx_topics_lp ON jforum_topics(topic_last_post_id);
CREATE INDEX idx_topics_time ON jforum_topics(topic_time);
CREATE INDEX idx_topics_type ON jforum_topics(topic_type);
CREATE INDEX idx_topics_moved ON jforum_topics(topic_moved_id);

--
-- Table structure for table 'jforum_topics_watch'
--
DROP TABLE IF EXISTS jforum_topics_watch;
CREATE TABLE jforum_topics_watch (
  topic_id INT DEFAULT 0 NOT NULL,
  user_id INT DEFAULT 0 NOT NULL,
  is_read INT DEFAULT 0 NOT NULL
);
CREATE INDEX idx_tw_topic ON jforum_topics_watch(topic_id);
CREATE INDEX idx_tw_user ON jforum_topics_watch(user_id);

--
-- Table structure for table 'jforum_users'
--
DROP TABLE IF EXISTS jforum_users;
CREATE TABLE jforum_users (
  user_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  user_active INT DEFAULT NULL,
  username VARCHAR(50) DEFAULT '' NOT NULL,
  user_password VARCHAR(128) DEFAULT '' NOT NULL,
  user_session_time INT DEFAULT 0 NOT NULL,
  user_session_page INT DEFAULT 0 NOT NULL,
  user_lastvisit TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  user_regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  user_level INT DEFAULT NULL,
  user_posts INT DEFAULT 0 NOT NULL,
  user_timezone VARCHAR(5) DEFAULT '' NOT NULL,
  user_style INT DEFAULT NULL,
  user_lang VARCHAR(255) DEFAULT '' NOT NULL,
  user_dateformat VARCHAR(20) DEFAULT '%d/%M/%Y %H:%i' NOT NULL,
  user_new_privmsg INT DEFAULT 0 NOT NULL,
  user_unread_privmsg INT DEFAULT 0 NOT NULL,
  user_last_privmsg TIMESTAMP NULL,
  user_emailtime TIMESTAMP NULL,
  user_viewemail INT DEFAULT 0,
  user_attachsig INT DEFAULT 1,
  user_allowhtml INT DEFAULT 0,
  user_allowbbcode INT DEFAULT 1,
  user_allowsmilies INT DEFAULT 1,
  user_allowavatar INT DEFAULT 1,
  user_allow_pm INT DEFAULT 1,
  user_allow_viewonline INT DEFAULT 1,
  user_notify INT DEFAULT 1,
  user_notify_always INT DEFAULT 0,
  user_notify_text INT DEFAULT 0,  
  user_notify_pm INT DEFAULT 1,
  user_popup_pm INT DEFAULT 1,
  rank_id INT DEFAULT 0,
  user_avatar VARCHAR(100) DEFAULT NULL,
  user_avatar_type INT DEFAULT 0 NOT NULL,
  user_email VARCHAR(255) DEFAULT '' NOT NULL,
  user_icq VARCHAR(15) DEFAULT NULL,
  user_website VARCHAR(255) DEFAULT NULL,
  user_from VARCHAR(100) DEFAULT NULL,
  user_sig LONGVARCHAR,
  user_sig_bbcode_uid VARCHAR(10) DEFAULT NULL,
  user_aim VARCHAR(255) DEFAULT NULL,
  user_yim VARCHAR(255) DEFAULT NULL,
  user_msnm VARCHAR(255) DEFAULT NULL,
  user_occ VARCHAR(100) DEFAULT NULL,
  user_interests VARCHAR(255) DEFAULT NULL,
  user_biography LONGVARCHAR DEFAULT NULL,
  user_actkey VARCHAR(32) DEFAULT NULL,
  gender CHAR(1) DEFAULT NULL,
  themes_id INT DEFAULT NULL,
  deleted INT DEFAULT NULL,
  user_viewonline INT DEFAULT 1,
  security_hash VARCHAR(32),
  user_karma DECIMAL,
  user_authhash VARCHAR(32),
  user_twitter VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (user_id)
);

--
-- Table structure for table 'jforum_vote_desc'
--
DROP TABLE IF EXISTS jforum_vote_desc;
CREATE TABLE jforum_vote_desc (
  vote_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  topic_id INT DEFAULT 0 NOT NULL,
  vote_text VARCHAR(255) DEFAULT '' NOT NULL,
  vote_start TIMESTAMP NOT NULL,
  vote_length INT DEFAULT 0 NOT NULL,
  PRIMARY KEY (vote_id)
);

CREATE INDEX idx_vd_topic ON jforum_vote_desc(topic_id);

--
-- Table structure for table 'jforum_vote_results'
--
DROP TABLE IF EXISTS jforum_vote_results;
CREATE TABLE jforum_vote_results (
  vote_id INT DEFAULT 0 NOT NULL,
  vote_option_id INT DEFAULT 0 NOT NULL,
  vote_option_text VARCHAR(255) DEFAULT '' NOT NULL,
  vote_result INT DEFAULT 0 NOT NULL
);
CREATE INDEX idx_vr_id ON jforum_vote_results(vote_id);

--
-- Table structure for table 'jforum_vote_voters'
--
DROP TABLE IF EXISTS jforum_vote_voters;
CREATE TABLE jforum_vote_voters (
  vote_id INT DEFAULT 0 NOT NULL,
  vote_user_id INT DEFAULT 0 NOT NULL,
  vote_user_ip VARCHAR(15) DEFAULT '' NOT NULL
);
CREATE INDEX idx_vv_id ON jforum_vote_voters(vote_id);
CREATE INDEX idx_vv_user ON jforum_vote_voters(vote_user_id);

--
-- Table structure for table 'jforum_words'
--
DROP TABLE IF EXISTS jforum_words;
CREATE TABLE jforum_words (
  word_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  word VARCHAR(100) DEFAULT '' NOT NULL,
  replacement VARCHAR(100) DEFAULT '' NOT NULL,
  PRIMARY KEY (word_id)
);

--
-- Table structure for table 'jforum_karma'
--
DROP TABLE IF EXISTS jforum_karma;
CREATE TABLE jforum_karma (
  karma_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  post_id INT NOT NULL,
  topic_id INT NOT NULL,
  post_user_id INT NOT NULL,
  from_user_id INT NOT NULL,
  points INT NOT NULL,
  rate_date TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (karma_id)
);
CREATE INDEX idx_krm_post ON jforum_karma(post_id);
CREATE INDEX idx_krm_topic ON jforum_karma(topic_id);
CREATE INDEX idx_krm_user ON jforum_karma(post_user_id);
CREATE INDEX idx_krm_from ON jforum_karma(from_user_id);

--
-- Table structure for table 'jforum_bookmark'
--
DROP TABLE IF EXISTS jforum_bookmarks;
CREATE TABLE jforum_bookmarks (
  bookmark_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  user_id INT NOT NULL,
  relation_id INT NOT NULL,
  relation_type INT NOT NULL,
  public_visible INT DEFAULT 1,
  title VARCHAR(255),
  description VARCHAR(255),
  PRIMARY KEY (bookmark_id)
);
CREATE INDEX idx_bok_user ON jforum_bookmarks(user_id);
CREATE INDEX idx_bok_rel ON jforum_bookmarks(relation_id);

-- 
-- Table structure for table 'jforum_quota_limit'
--
DROP TABLE IF EXISTS jforum_quota_limit;
CREATE TABLE jforum_quota_limit (
  quota_limit_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  quota_desc VARCHAR(50) NOT NULL,
  quota_limit INT NOT NULL,
  quota_type INT DEFAULT 1,
  PRIMARY KEY (quota_limit_id)
);

--
-- Table structure for table 'jforum_extension_groups'
--
DROP TABLE IF EXISTS jforum_extension_groups;
CREATE TABLE jforum_extension_groups (
  extension_group_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  name VARCHAR(100) NOT NULL,
  allow INT DEFAULT 1,
  upload_icon VARCHAR(100),
  download_mode INT DEFAULT 1,
  PRIMARY KEY (extension_group_id)
);

-- 
-- Table structure for table 'jforum_extensions'
--
DROP TABLE IF EXISTS jforum_extensions;
CREATE TABLE jforum_extensions (
  extension_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  extension_group_id INT NOT NULL,
  description VARCHAR(100),
  upload_icon VARCHAR(100),
  extension VARCHAR(10),
  allow INT DEFAULT 1,
  PRIMARY KEY (extension_id)
);
CREATE INDEX idx_ext_group ON jforum_extensions(extension_group_id);
CREATE INDEX idx_ext_ext ON jforum_extensions(extension);

--
-- Table structure for table 'jforum_attach'
--
DROP TABLE IF EXISTS jforum_attach;
CREATE TABLE jforum_attach (
  attach_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  post_id INT,
  privmsgs_id INT,
  user_id INT NOT NULL,
  PRIMARY KEY (attach_id)
);
CREATE INDEX idx_att_post ON jforum_attach(post_id);
CREATE INDEX idx_att_priv ON jforum_attach(privmsgs_id);
CREATE INDEX idx_att_user ON jforum_attach(user_id);

-- 
-- Table structure for table 'jforum_attach_desc'
--
DROP TABLE IF EXISTS jforum_attach_desc;
CREATE TABLE jforum_attach_desc (
  attach_desc_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  attach_id INT NOT NULL,
  physical_filename VARCHAR(255) NOT NULL,
  real_filename VARCHAR(255) NOT NULL,
  download_count INT,
  description VARCHAR(255),
  mimetype VARCHAR(85),
  filesize INT,
  upload_time DATETIME,
  thumb INT DEFAULT 0,
  extension_id INT,
  PRIMARY KEY (attach_desc_id)
);
CREATE INDEX idx_att_d_att ON jforum_attach_desc(attach_id);
CREATE INDEX idx_att_d_ext ON jforum_attach_desc(extension_id);

--
-- Table structure for table 'jforum_attach_quota'
--
DROP TABLE IF EXISTS jforum_attach_quota;
CREATE TABLE jforum_attach_quota (
  attach_quota_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  group_id INT NOT NULL,
  quota_limit_id INT NOT NULL,
  PRIMARY KEY (attach_quota_id)
);
CREATE INDEX idx_aq_group ON jforum_attach_quota(group_id);
CREATE INDEX idx_aq_ql ON jforum_attach_quota(quota_limit_id);

--
-- Table structure for table 'jforum_banner'
--
DROP TABLE IF EXISTS jforum_banner;
CREATE TABLE jforum_banner (
  banner_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  banner_name VARCHAR(90),
  banner_placement INT DEFAULT 0 NOT NULL,
  banner_description VARCHAR(250),
  banner_clicks INT DEFAULT 0 NOT NULL,
  banner_views INT DEFAULT 0 NOT NULL,
  banner_url VARCHAR(250),
  banner_weight INT DEFAULT 50 NOT NULL,
  banner_active INT DEFAULT 0 NOT NULL,
  banner_comment VARCHAR(250),
  banner_type INT DEFAULT 0 NOT NULL,
  banner_width INT DEFAULT 0 NOT NULL,
  banner_height INT DEFAULT 0 NOT NULL,
  PRIMARY KEY (banner_id)
);

--
-- Table structure for table 'jforum_moderation_log'
-- 
DROP TABLE IF EXISTS jforum_moderation_log;
CREATE TABLE jforum_moderation_log (
  log_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  user_id INT NOT NULL,
  log_description LONGVARCHAR NOT NULL,
  log_original_message LONGVARCHAR,
  log_date TIMESTAMP NOT NULL,
  log_type INT DEFAULT 0,
  post_id INT DEFAULT 0,
  topic_id INT DEFAULT 0,
  post_user_id INT DEFAULT 0,
  PRIMARY KEY (log_id)
);
CREATE INDEX idx_ml_user ON jforum_moderation_log(user_id);
CREATE INDEX idx_ml_post_user ON jforum_moderation_log(post_user_id);

--
-- Table structure for table 'jforum_mail_integration'
--
CREATE TABLE jforum_mail_integration (
  forum_id INT NOT NULL,
  forum_email VARCHAR(100) NOT NULL,
  pop_username VARCHAR(100) NOT NULL,
  pop_password VARCHAR(100) NOT NULL,
  pop_host VARCHAR(100) NOT NULL,
  pop_port INT DEFAULT 110,
  pop_ssl INT DEFAULT 0
);
CREATE INDEX idx_mi_forum ON jforum_mail_integration(forum_id);

--
-- Table structure for table 'jforum_api'
--
CREATE SEQUENCE jforum_api_seq;
CREATE TABLE jforum_api (
  api_id INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1),
  api_key VARCHAR(32) NOT NULL,
  api_validity TIMESTAMP NOT NULL,
  PRIMARY KEY (api_id)
);

--
-- Table structure for table 'jforum_spam'
--
CREATE TABLE jforum_spam (
  pattern VARCHAR(100) NOT NULL
);

