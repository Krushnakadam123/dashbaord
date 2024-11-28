package com.example.dashboarddemo.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "msgg") // Name of the database table
public class Msg {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-incrementing primary key
    @Column(name = "msg_id")
    private Long msgId;

    @Override
	public String toString() {
		return "Msg [msgId=" + msgId + ", sName=" + sName + ", mobile=" + mobile + ", subject=" + subject + ", message="
				+ message + "]";
	}

	@Column(name = "s_name", nullable = false) // Sender's name
    private String sName;

    @Column(name = "mobile", nullable = false) // Mobile number
    private String mobile;

    @Column(name = "subject", nullable = false) // Subject of the message
    private String subject;

    @Column(name = "message", nullable = false) // The actual message content
    private String message;

    // Default constructor
    public Msg() {
    }

    // Getters and Setters
    public Long getMsgId() {
        return msgId;
    }

    public void setMsgId(Long msgId) {
        this.msgId = msgId;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}

