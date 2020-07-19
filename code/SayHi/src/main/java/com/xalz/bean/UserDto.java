package com.xalz.bean;

import org.springframework.web.multipart.MultipartFile;

public class UserDto {
    private User user;
    private MultipartFile multipartFile;
    
    
    
	public UserDto() {
		super();
	}
	public UserDto(User user, MultipartFile multipartFile) {
		super();
		this.user = user;
		this.multipartFile = multipartFile;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
    
    
}

