package com.ksmart.harulook.hof.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HofDao {
	
	@Autowired
	 private SqlSessionTemplate sqlSessionTemplate;
	
	/*이번 달 좋아요 랭크보기*/
	public List<HofRankDto> getBoardLikeRank(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.hof.service.HofMapper.getBoardLikeRank");
	}
	/*명예의전당 등록처리*/
	public int insertHof(HofDto dto){
		return sqlSessionTemplate.insert("com.ksmart.harulook.hof.service.HofMapper.insertHof",dto);
	}
	/*이번 달 명예의전당 목록보기*/
	public List<HofDto> getHofList(){
		return sqlSessionTemplate.selectList("com.ksmart.harulook.hof.service.HofMapper.getHofList");
	}
	/*명예의전당 중복체크*/
	public int selectDuplicateHof(String boardNo){
		return sqlSessionTemplate.selectOne("com.ksmart.harulook.hof.service.HofMapper.dupliacteHof",boardNo);
	}
	public int test(){
		return sqlSessionTemplate.insert("com.ksmart.harulook.hof.service.HofMapper.test");
	}
	
	/*이번 달 명예의전당 등록*/
	public void insertHof(){
		HofDto dto = new HofDto();
		List<HofRankDto> list = getBoardLikeRank();
		for(int n =0,rank=1; rank<4;n++){
			
			String boardNo = list.get(n).getBoardNo();
			int r = list.get(n).getRank();
			int nextr = list.get(n+1).getRank();
			int result = selectDuplicateHof(boardNo);
			
			if(result==0){//명예의전당에 등록된 게시물 아닐때
				dto.setBoardNo(boardNo);
				dto.setHofRank(rank);
				switch(rank){//등수에 따른 상품
				case 1 :dto.setPointPolicyNo("point_ex_6");break;
				case 2 :dto.setPointPolicyNo("point_ex_7");break;
				case 3 :dto.setPointPolicyNo("point_ex_8");break;
				default : break;
				}
				insertHof(dto);
				if(r!=nextr){//이번게시물과 다음게시물이 같은등수가 아닐때만 등수를 증가시킨다.
					rank++;
				}
				
			}
		}
		System.out.println("insertHof종료");
		}

	
}
