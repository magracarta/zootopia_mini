package zootopia_mini.zootopia.controller.action.contest;

import java.util.Map;
import java.util.Map.Entry;

import zootopia_mini.zootopia.util.Paging;

public enum ContestAdminEnum {
	CONESTVIEW("contestpet_view") , 
	CONTESTPETVIEW("contestpetiv_view"),
	CONTEST("contest"),
	CONTESTPET("contest_pet");

	
	private final String condition;
	
	 ContestAdminEnum(String condition) {
		this.condition = condition;	
	}
	
	
	public String getSelectSQL(String search , String where , Paging page , String oredby) {
		if (search.equals(" ")) return "select * from "+ condition +" WHERE "+where+"  order by "+oredby;
		else return "select * from "+ condition +"  WHERE subject LIKE '%"+search+"%' "+ where +" order by "+oredby+" limit "+page.getRecordrow()+" offset "+page.getOffsetnum();
	}
	
	public String getAllcount(String search , String where) {
		return "select count(*) as cnt from "+ condition +" where subject like '%"+search+"%' " + where;
	}
	
	public String deleteSQL(String where) {
		return "delete from "+ condition +"  where "+ where;
	}
	
	public String updateSQL( Map<String, String> maplist , String where ) {
		Map<String, String> map = maplist;
		StringBuilder setString  =  new StringBuilder("update " + condition + " set ");
		int count = 0;
		for(Entry<String, String> pair : map.entrySet() ) {
			count ++;
            setString.append(pair.getKey()).append(" = ");
            
            if(isNumeric(pair.getValue()))setString.append(pair.getValue());
            else setString.append("'"+pair.getValue()+"'");
            
            
			if(map.size() > count ) setString.append(" , ");
			else setString.append(" ");
		}
		setString.append(where);
		return setString.toString();
	}
	
	
	public String addSQL( Map<String, String> maplist , String where ) {
		Map<String, String> map = maplist;
		
		StringBuilder key  =  new StringBuilder(" ");
		StringBuilder value  =  new StringBuilder(" ");
		int count = 0;
		for(Entry<String, String> pair : map.entrySet() ) {
			count ++;
			key.append(pair.getKey());
			
			
			if(isNumeric(pair.getValue()))value.append(pair.getValue());
            else value.append(" '"+pair.getValue()+"' ");
            
			
			
			if(map.size() > count ) {
				key.append(" , ");
				value.append(" , ");
			}else {
				key.append(" ");
				value.append(" ");
			}
		}

		String sql = "insert into " + condition + " ( "+key.toString()+" ) values ("+value.toString()+")";
		return sql;
	}
	
	
	public static boolean isNumeric(String str) {
		if(str  == null)return false;
		
		try {
			Integer.parseInt(str);
		}catch (NumberFormatException e) {
			return false;
		}
		
		return true;
	}
	
	
}
