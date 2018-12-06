package com.wjl.graduate.pojo;

import java.util.Date;

public class Message {
        private  int id;
        private  String sname;
        public String getSname() {
			return sname;
		}
		public void setSname(String sname) {
			this.sname = sname;
		}
		private  Date create_time;
        private  String author;
        private  String review;
        private  Date  review_time;
        public String getReview() {
			return review;
		}
		public void setReview(String review) {
			this.review = review;
		}
		public Date getReview_time() {
			return review_time;
		}
		public void setReview_time(Date review_time) {
			this.review_time = review_time;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		public Date getCreate_time() {
			return create_time;
		}
		public void setCreate_time(Date create_time) {
			this.create_time = create_time;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		private   String content;
        
}
