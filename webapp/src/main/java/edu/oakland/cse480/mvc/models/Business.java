package edu.oakland.cse480.mvc.models;

public class Business {
        public int id;
        public String name;
        public int owner_id;
	public String contact_info;
	public String info;
	public String icon_url;

        public Business() {}
        public int getID() {return id;}
        public String getName() {return name;}
        public int getOwnerID() {return owner_id;}
	public String getContactInfo() {return contact_info;}
	public String getinfo() {return info;}
	public String getIconURL() {return icon_url;}
}
