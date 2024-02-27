package vn.dev.tttn.service;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.dev.tttn.entity.Friend;
import vn.dev.tttn.entity.User;


@Service
public class FriendService extends BaseService<Friend>{
	
	@Override
	public Class<Friend> clazz(){
		return Friend.class;
	}
	
	// trả về Friend( phục vụ việc lấy user trong userService )
	@SuppressWarnings("unchecked")
	public List<Friend> getFriendList(Integer userId){
		String sql = "select * from tttnsql.tbl_friend where user_id=" + userId + ";";
		return (List<Friend>) this.getEntityByNativeSql(sql);
	}

	@Transactional
	public Friend saveAddFrient(User userLogined, Integer userId) {
		Friend _friend = new Friend();
		_friend.setCreateDate(new Date());
		_friend.setFriendId(userId);
		_friend.setUser_friend(userLogined);
		return super.saveOrUpdate(_friend);
	}
	
	
	public boolean checkIsFriend(Integer loginedId, Integer objectId) {
		String sql = "select * from tttnsql.tbl_friend where user_id=" + loginedId 
					+ " and friend_id=" + objectId;
		if(super.getEntityByNativeSql(sql) == null) {
			return false;
		}
		return true;
	}
	/*lấy ra danh sach không chùng lặp tuwcslaf userId và objectId có tầm quan trọng như nhau
	 *  làm thế nào để xác định objectId là bạn của friend
	 *  lấy alllist sau đó order by với UserId */
}
