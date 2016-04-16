package com.entity;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.entity.enums.PaymentType;




@Entity
@Table(name = "payments")
public class Payment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "userId")
	private User user;
	private Double expense;
	private Date createDate;
	private String paymentMonth;
	private int paymentYear;
	@Enumerated(EnumType.STRING)
	private PaymentType paymentType;

	public Payment() {
	}

	public Payment(User user, Double expense, Date createDate, String paymentMonth, int paymentYear,
			PaymentType paymentType) {
		super();
		this.user = user;
		this.expense = expense;
		this.createDate = createDate;
		this.paymentMonth = paymentMonth;
		this.paymentYear = paymentYear;
		this.paymentType = paymentType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Double getExpense() {
		return expense;
	}

	public void setExpense(Double expense) {
		this.expense = expense;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getPaymentMonth() {
		return paymentMonth;
	}

	public void setPaymentMonth(String paymentMonth) {
		this.paymentMonth = paymentMonth;
	}

	public int getPaymentYear() {
		return paymentYear;
	}

	public void setPaymentYear(int paymentYear) {
		this.paymentYear = paymentYear;
	}

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "Payment [id=" + id + ", user= " + user.getName() + ", expense=" + expense + ", createDate="
				+ createDate + ", paymentMonth=" + paymentMonth + ", paymentYear=" + paymentYear + ", paymentType="
				+ paymentType + "]";
	}

}

