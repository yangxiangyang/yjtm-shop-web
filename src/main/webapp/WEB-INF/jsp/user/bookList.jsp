<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript" type="text/javascript" src="/scripts/date/ui.datepicker.js"></script>
<link rel="stylesheet" type="text/css" href="/ext3.0/resources/css/ext-all.css" />
<script type="text/javascript" src="/ext3.0/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="/ext3.0/ext-all.js"></script>
<link rel="stylesheet" href="/scripts/date/ui.datepicker.css" type="text/css" media="screen" title="core css file" charset="utf-8" />
<script type="text/javascript" src="/common/js/datepickerUtil.js"></script>
<script type="text/javascript" src="/common/js/bookList.js"></script>
<script type="text/javascript">
        	function conversion (bookId){
        			if(window.confirm('你确定转换该图书吗?')){
        			var url = '/book/book!conversion.htm';
        			var paras = 'bookId=' + bookId;
        			$.ajax({
			    	    url:url,
			    	    data:paras,
			    	    type:"post",
			    	    dataType:"json",
			    	    success:function(jsonObj){
			    	    	var flag = jsonObj.exeResult;
			    	    	if('0' == flag){
			    	    	    alert("转换成功");
			                    window.location = '/book/book!bookList.htm';
			    	    	}else{
			    	    		alert("转换失败，查看日志");
			    	    	}
			    	    },
			    	    error:function(){
			    	        alert("转换失败，请联系管理员");	    	        
			    	    }
			    	});
        		}
        		
        	}
        	
        	
        	function bookExp(v){
        		new BookExpWindow({bookCode:v}).show();
        	}
        	
        	function audit(bookId,state){
        		var t = '';
        		if(state==1){
        			t = '上';
        		}else{
        			t = '下';
        		}
        		if(window.confirm('你确定'+ t +'架该图书吗?')){
        			var url = '/book/book!auditBook.htm';
        			var paras = 'bookId=' + bookId + "&state=" + state;
        			$.ajax({
			    	    url:url,
			    	    data:paras,
			    	    type:"post",
			    	    dataType:"text",
			    	    success:function(jsonObj){
			    	    	var flag = jsonObj;
			    	    	if('1' == flag){
			                    window.location = '/book/book!bookList.htm';
			    	    	}else{
			    	    		alert(jsonObj);
			    	    	}
			    	    },
			    	    error:function(){
			    	        alert("请稍候再试!");		    	        
			    	    }
			    	});
        		}
        		return false;
        	}
        	
        	

			function rejectBook(){
					var ids =$('#idsd').val();
					var stats =$('#stats').val();
		        	if(''==ids){
		        		alert('请选择要驳回的信息');
		        		return false;
		        	}
		        	var arrys = ids.split(',');
					    if(arrys.length >1){
					    	alert("只能选择一条记录");
					    	return false;
					}
					if(stats == '1'){
						alert("该图书已上架，不可操作");
						return false;
					}
					    
				    if(window.confirm('你确定要对选中的图书执行驳回操作吗?')){
			        	$.ajax({
				    	    url:'/book/book!rejectBook.htm',
				    	    data:{bookId:ids},
				    	    type:"post",
				    	    dataType:"text",
				    	    success:function(v){
				    	    	if(v=='0'){
				    	    		window.location = '/book/book!bookList.htm';
				    	    	}
				    	    	if(v=='1'){
				    	    		alert('已注册，不可操作！');
				    	    	}
				    	    },
				    	    error:function(){
				    	        alert("加密统计失败，请联系管理员!");		    	        
				    	    }
				    	});
				     }
			}
			
			
			function deleBook(){
					var ids =$('#idsd').val();
					var stats =$('#stats').val();
					
					
		        	if(''==ids){
		        		alert('请选择要驳回的信息');
		        		return false;
		        	}
		        	var arrys = ids.split(',');
					    if(arrys.length >1){
					    	alert("只能选择一条记录");
					    	return false;
					}
					if(stats !='3'){
						alert('只能删除驳回状态信息');
						return false;
					}
				    if(window.confirm('你确定要对选中的图书执行删除操作吗?')){
			        	$.ajax({
				    	    url:'/book/book!deleBooks.htm',
				    	    data:{bookId:ids},
				    	    type:"post",
				    	    dataType:"text",
				    	    success:function(v){
				    	    	if(v=='0'){
				    	    		window.location = '/book/book!bookList.htm';
				    	    	}
				    	    	if(v=='1'){
				    	    		alert('已注册，不可操作！');
				    	    	}
				    	    },
				    	    error:function(){
				    	        alert("操作失败，请联系管理员!");		    	        
				    	    }
				    	});
				     }
			}
			
			
        	function checkAll(){
			    var d = document,
			    items = d.getElementsByName("bookId"),
			    itemall = d.getElementById("selectAll"),
			    len = items.length;
			    var ids = '';
			    var stats = '';
			    for(var i = 0; i < len; i++){
			        items[i].checked = itemall.checked;
			        ids += items[i].id + ",";
			        stats +=items[i].value + "," 
			    }
			    if('' != ids){
			    	ids = ids.substr(0,ids.length - 1);
			    	stats = stats.substr(0,stats.length - 1);
			    }
			    if(!itemall.checked){
			    	ids = '';
			    	stats = '';
			    }
			    $('#idsd').val(ids);
			    $('#stats').val(stats);
			}
			
			function checkOne(){
				var ids = '';
				var stats = '';
				var items = document.getElementsByName("bookId");
				len = items.length;
				
				for(var i = 0; i < len; i++){
			        if(items[i].checked){
			        	ids += items[i].id + ",";
			        	stats +=items[i].value + "," ;
			        }
			    }
				if('' != ids){
			    	ids = ids.substr(0,ids.length - 1);
			    	stats = stats.substr(0,stats.length - 1);
			    }
			    $('#idsd').val(ids);
			    $('#stats').val(stats);
			}
			
			function shangjia(){
					if(window.confirm('你确定要执行图书上架操作吗?')){
        			var url = '/book/book!auditBook.htm';
        			var paras = 'bookId=' + bookId + "&state=" + state;
        			$.ajax({
			    	    url:url,
			    	    data:paras,
			    	    type:"post",
			    	    dataType:"text",
			    	    success:function(jsonObj){
			    	    	var flag = jsonObj;
			    	    	if('1' == flag){
			                    window.location = '/book/book!bookList.htm';
			    	    	}else{
			    	    		alert(jsonObj);
			    	    	}
			    	    },
			    	    error:function(){
			    	        alert("请稍候再试!");		    	        
			    	    }
			    	});
        		}
			}
			
			function showWindow(){
				var ids =$('#idsd').val();
	        	if(''==ids){
	        		Ext.MessageBox.alert("提示","请选择要加密的信息");
	        		return false;
	        	}
	        	var arrys = ids.split(',');
				    if(arrys.length >1){
				   		Ext.MessageBox.alert("提示","只能选择一条记录");
				    	return false;
				    }
				new Ext.MyWindow({bookId:ids}).show();
			}
			
			function tests(){
				new BookExpWindow().show();
			}
        </script>
</head>
<body>
	<div class="layout_top">
		<div class="nav">
			<a href="#" class="hot">首页</a>
		</div>
	</div>

	<div class="layout_left" id="cont_left">
		<script>leftM("自有图书管理","图书列表");</script>
	</div>

	<div class="layout_right" id="cont_right">
		<!--			<div class="gototag">当前位置：图书管理</div>
 -->
		<form name="bookSearchForm" id="bookSearchForm" class="main_input" action="/book/searchBook.htm" method="post">
			<table class="tablecont" cellspacing="0" cellpadding="0" rules="rows" border="0">

				<input type="hidden" name="idsd" id="idsd" />
				<input type="hidden" name="stats" id="stats" />
				<tr class="tit">
					<th class="tit" colspan=9;><strong>图书列表</strong></th>
				</tr>
				<tr height="35">
					<td width="7%" align="right" style="padding-top: 10px;">图书名称</td>
					<td width="15%" style="padding-top: 10px;">
						<input type="text" name="book.name" size="20" maxlength="20" value="${book.name}" />
					</td>
					<td width="7%" align="right" style="padding-top: 10px;">作者名称</td>
					<td width="15%" style="padding-top: 10px;">
						<input type="text" name="book.authorName" size="20" value="${book.authorName}" />
					</td>
					<td width="7%" align="right" style="padding-top: 10px;">内容提供商</td>
					<td width="15%" style="padding-top: 10px;">
						<input type="text" name="book.publishName" size="20" value="${book.publishName}" />
					</td>

					<td width="7%" align="left" rowspan="3">
						<input type="submit" class="main_but" value="查询" onclick="submitForm()" ; />
					</td>
					<input type="hidden" name="registerCount" value=<s:property value="registerCount"/> />
					<input type="hidden" name="encryptCount" value=<s:property value="encryptCount"/> />
				</tr>
				<tr height="35">
					<td align="right">图书类别</td>
					<td>

						<select class="main_select" name="book.categoryId" id="categoryId">
							<option value="0">请选择</option>
							<s:iterator value="categoryList" status="category" id="category">
								<s:if test="id == book.categoryId">
									<option value="<s:property value='id'/>" selected>
										<s:property value="name" />
									</option>
								</s:if>
								<s:else>
									<option value="<s:property value='id'/>">
										<s:property value="name" />
									</option>
								</s:else>

							</s:iterator>
						</select>
					</td>
					<td align="right">图书状态</td>
					<td>
						<select class="main_select" name="book.state" id="state">
							<option value="-1">请选择</option>
							<s:if test="1 == book.state">
								<option value="1" selected>上架</option>
							</s:if>
							<s:else>
								<option value="1">上架</option>
							</s:else>
							<s:if test="0 == book.state">
								<option value="0" selected>下架</option>
							</s:if>
							<s:else>
								<option value="0">下架</option>
							</s:else>
						</select>
					</td>
					<td align="right">文件类型</td>
					<td>
						<select class="main_select" name="book.formatType" id="formatType">
							<option value="0">请选择</option>
							<!--<s:if test="2 == book.formatType">
								<option value="2" selected>TXT</option>
							</s:if>
							<s:else>
								<option value="2">TXT</option>
							</s:else>   -->
							<s:if test="3 == book.formatType">
								<option value="3" selected>PDF</option>
							</s:if>
							<s:else>
								<option value="3">PDF</option>
							</s:else>
							<s:if test="4 == book.formatType">
								<option value="4" selected>EPUB</option>
							</s:if>
							<s:else>
								<option value="4">EPUB</option>
							</s:else>
							<s:if test="5 == book.formatType">
								<option value="5" selected>DRMCF</option>
							</s:if>
							<s:else>
								<option value="5">DRMCF</option>
							</s:else>
						</select>
					</td>
				</tr>
				<tr height="35">
					<td width="7%" align="right" style="padding-top: 10px;">关键字</td>
					<td width="15%" style="padding-top: 10px;">
						<input type="text" name="book.bookKeyword" size="20" maxlength="20" value="${book.bookKeyword}" />
					</td>
					<td align="right">开始时间</td>
					<td>
						<input id="beginDate" name="beginTime" type="text" value="${beginTime }" size="20" readonly></input>
					</td>
					<td align="right">结束时间</td>
					<td>
						<input id="endDate" name="endTime" type="text" value="${endTime }" size="20" readonly></input>
					</td>
				</tr>
				<tr height="35">
					<td colspan=9;>
						<input type="hidden" id="hidden" value="${session.admin_user.username }" />
						<s:if test="registerCount==0">
							<input type="button" value="图书注册" class="main_but1" onclick="zhuce();" />
						</s:if>
						<s:else>
							<input type="button" value="图书注册" class="main_but1" onclick="zhuce();" />
						</s:else>
						<s:if test="encryptCount==0">
							<input type="button" value="图书加密" class="main_but1" onclick="showWindow();" />
						</s:if>
						<s:else>
							<input type="button" value="图书加密" class="main_but1" onclick="showWindow();" />
						</s:else>
						<input type="button" value="图书驳回" class="main_but1" onclick="rejectBook();" />
						<input type="button" value="图书删除" class="main_but1" onclick="deleBook();" />

					</td>
				</tr>
				<tr>
					<td colspan="6" style="padding-left: 10px;">
						<labe style="color: red;">*备注：只有PDF格式的图书可以进行【转换】操作，只有EPUB格式的图书可以进行【内容提取】操作。</labe>
					</td>
				</tr>
			</table>
		</form>
		<br />
		<s:set name="a" value="0" />
		<table class="tablecont" id="tab_1" cellspacing="0" cellpadding="0" rules="rows" border="0">

			<tr class="tit">
				<th width="20"><input id="selectAll" type="checkbox" onClick="checkAll();" /></th>

				<th width="100">图书名称</th>
				<th width="50">所属分类</th>
				<!-- <th>DRMI</th> -->
				<th width="50">原价(元)</th>
				<th width="50">销售价(元)</th>
				<th width="50">作者</th>
				<!-- <th>ISBN</th> -->
				<th>内容提供商</th>
				<th>出版时间</th>
				<!-- <th>点击数</th> -->
				<th width="50">状态</th>
				<th>免费章节</th>
				<th width="20">类型</th>
				<th>创建时间</th>
				<th>注册状态</th>
				<th>加密状态</th>
				<th>操作</th>
				<th>文件操作</th>
			</tr>
			<s:iterator value="pageModel.result" status="item" id="source">

				<tr align="center">

					<td>
						<input name="bookId" id="<s:property value="id"/>" type="checkbox" value=<s:property value="state" /> onclick="checkOne();" />
					</td>
					<td>
						<s:property value="pageModel.result[#item.index].name" />
					</td>
					<td>
						<s:property value="bookCategory.name" />
					</td>
					<%-- <td><s:property value="drmi"/></td> --%>
					<td>
						<fmt:formatNumber value="${price}" pattern="#0.00" />
					</td>
					<td>
						<fmt:formatNumber value="${discount}" pattern="#0.00" />
					</td>
					<td>
						<s:property value="authorName" />
					</td>
					<%-- <td><s:property value="isbn"/></td> --%>
					<td>
						<s:property value="publishName" />
					</td>
					<td>
						<s:property value="publishTime" />
					</td>
					<%-- <td><s:property value="clickNum"/></td> --%>
					<td>
						<s:if test="state==0">
							<span style="color: red">下架</span>
						</s:if>
						<s:if test="state==1">
							<span style="color: #00A600">上架</span>
						</s:if>
						<s:if test="state==3">
							<span style="color: red">驳回</span>
						</s:if>
					</td>
					<td>
						<s:property value="freePageCount" />
					</td>
					<td>
						<s:if test="formatType==2">TXT</s:if>
						<s:if test="formatType==3">PDF</s:if>
						<s:if test="formatType==4">EPUB</s:if>
						<s:if test="formatType==5">DRMCF</s:if>
					</td>
					<td>
						<s:property value="createTime" />
					</td>
					<td>
						<s:if test="drmi==0">
							<span style="color: red">未注册</span>
						</s:if>
						<s:else>
							<span style="color: #00A600">已注册</span>
						</s:else>
					</td>
					<td>
						<s:if test="privateKey==null">
							<span style="color: red">未加密</span>
						</s:if>
						<s:else>
							<span style="color: #00A600">已加密</span>
						</s:else>
					</td>
					<td align="center">
						<!-- <a href="#">预览	</a> -->

						<s:if test="drmi==0">
							<a href="/book/book!forEditBook.htm?bookId=<s:property value="id"/>">修改</a>
						</s:if>

						<s:if test="privateKey!=null">
							<s:if test="state==0">
								<a href="#" onclick="audit(<s:property value="id"/>,1);">上架</a>
							</s:if>
							<s:if test="state==1">
								<a href="#" onclick="audit(<s:property value="id"/>,0);">下架</a>
							</s:if>
						</s:if>
						<%-- <a href="/book/bookfiledown!downloadFile.htm?bookId=<s:property value="id"/>">下载</a> --%>
					</td>
					<td>
						<s:if test="formatType!=4">
							<s:if test="switchState==0">
								无操作
							</s:if>
							<s:if test="switchState!=0">
								<s:if test="privateKey!=null">

									<s:if test="state==1 && formatType!=5">
										<input type="button" onclick="conversion(<s:property value="id"/>)" value="转换" />
									</s:if>
									<s:else>
									无操作
								</s:else>
								</s:if>
							</s:if>
						</s:if>
						<s:if test="formatType==4">
							<s:if test="1 == state">
								<input type="button" onclick="bookExp('<s:property value="bookCode"/>')" value="内容提取" />
							</s:if>
							<s:else>
								无操作
							</s:else>
						</s:if>

					</td>
				</tr>
			</s:iterator>
			<tr>
				<td colspan="13" class="bot">
					<div class="page right">
						<s:if test="pageModel.pageInfo.pageCount>=1">
							<s:property value="pageModel.pageInfo.pageLink" escape="false" />
						</s:if>
					</div>
				</td>
			</tr>
		</table>

		<!-- </form> -->
	</div>
	<div class="layout_bot">
	</div>
</body>
</html>

