/*
 * Copyright (c) JForum Team
 * All rights reserved.

 * Redistribution and use in source and binary forms, 
 * with or without modification, are permitted provided 
 * that the following conditions are met:

 * 1) Redistributions of source code must retain the above 
 * copyright notice, this list of conditions and the 
 * following disclaimer.
 * 2) Redistributions in binary form must reproduce the 
 * above copyright notice, this list of conditions and 
 * the following disclaimer in the documentation and/or 
 * other materials provided with the distribution.
 * 3) Neither the name of "Rafael Steil" nor 
 * the names of its contributors may be used to endorse 
 * or promote products derived from this software without 
 * specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT 
 * HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, 
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE 
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER 
 * IN CONTRACT, STRICT LIABILITY, OR TORT 
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN 
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE
 * 
 * Created on 20/05/2004 - 15:24:07
 * net.jforum.entities.PrivateMessage.java
 * The JForum Project
 * http://www.jforum.net
 */
package net.jforum.entities;

import java.util.Date;

import net.jforum.view.forum.common.ViewCommon;

/**
 * @author Rafael Steil
 */
public class PrivateMessage 
{
	private int id;
	private int type;
	private User fromUser;
	private User toUser;
	private Post post;
	private Date postDate;

	public PrivateMessage() {
		// Empty Constructor
	}

	public PrivateMessage(final int id) {
		this.id = id;
	}

	/**
	 * @return Returns the fromUser.
	 */
	public User getFromUser()
	{
		return fromUser;
	}

	/**
	 * @param fromUser The fromUser to set.
	 */
	public void setFromUser(final User fromUser)
	{
		this.fromUser = fromUser;
	}

	/**
	 * @return Returns the toUser.
	 */
	public User getToUser()
	{
		return toUser;
	}

	/**
	 * @param toUser The toUser to set.
	 */
	public void setToUser(final User toUser)
	{
		this.toUser = toUser;
	}

	/**
	 * @return Returns the type.
	 */
	public int getType()
	{
		return type;
	}

	/**
	 * @param type The type to set.
	 */
	public void setType(final int type)
	{
		this.type = type;
	}

	/**
	 * @return Returns the id.
	 */
	public int getId()
	{
		return id;
	}

	/**
	 * @param id The id to set.
	 */
	public void setId(final int id)
	{
		this.id = id;
	}

	/**
	 * @return Returns the post.
	 */
	public Post getPost()
	{
		return post;
	}

	/**
	 * @param post The post to set.
	 */
	public void setPost(final Post post)
	{
		this.post = post;
	}
	
	/**
	 * @return Returns the postDate.
	 */
	public Date getPostDate() {
		return postDate;
	}

	/**
	 * @param postDate The post date to set.
	 */
	public void setPostDate(final Date postDate)
	{
		this.postDate = postDate;
	}

	/**
	 * @return Returns the formattedDate.
	 */
	public String getFormattedDate() {
        return ViewCommon.formatDate(postDate);
	}

    public String getFormattedDateAsGmt()
    {
		return ViewCommon.formatDateAsGmt(postDate);
    }
}
