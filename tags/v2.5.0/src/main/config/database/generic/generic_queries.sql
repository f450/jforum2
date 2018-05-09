# ############
        '' AS topic_title, p.topic_id, p.user_id, p.post_time, p.attach, pt.post_text, pt.post_subject, t.user_id as topic_user_id  \
    FROM jforum_posts p, jforum_posts_text pt, jforum_topics t  \
    WHERE p.post_id = pt.post_id \
    AND p.topic_id = t.topic_id \
    AND p.post_id >= ? AND p.post_id <= ?

SearchModel.getPostsDataForLucene = SELECT p.post_id, p.forum_id, p.topic_id, p.user_id, \
        u.username, p.enable_bbcode, p.enable_smilies, p.post_time, p.attach, \
        pt.post_subject, pt.post_text, t.topic_title, t.user_id as topic_user_id \
    FROM jforum_posts p, jforum_posts_text pt, jforum_users u, jforum_topics t \
    WHERE p.post_id IN (:posts:) \
    AND p.post_id = pt.post_id  \
    AND p.topic_id = t.topic_id \
    AND p.user_id = u.user_Id
