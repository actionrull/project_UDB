package com.tech.project.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("qotkddls9498@gmail.com","xiziynxyibqtcibj");
		
	}
}
