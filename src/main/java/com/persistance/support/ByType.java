package com.persistance.support;

import com.entity.enums.PaymentType;

public class ByType {
	private Double expense;
	private PaymentType paymentType;

	public ByType() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ByType(Double expense, PaymentType paymentType) {
		super();
		this.expense = expense;
		this.paymentType = paymentType;
	}

	public Double getExpense() {
		return expense;
	}

	public void setExpense(Double expense) {
		this.expense = expense;
	}

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "ByType [expense=" + expense + ", paymentType=" + paymentType + "]";
	}

}
