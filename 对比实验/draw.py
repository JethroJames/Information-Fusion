import matplotlib.pyplot as plt
x = ['Dempster','Murphy','Deng et.al','Lin et.al','Jiang','Xiao','Gao and Xiao','Proposed']
y = [0,0.7273,0.7261,0.6901,0.7328,0.8393,0.8504,0.8759]
font = {'family': 'serif',
        'serif': 'Times New Roman',
        'weight': 'normal',
        'size': 12}
plt.rc('font', **font)
plt.figure(dpi=1200,figsize=[6,7.5])
plt.bar(x,y,color=['magenta','blue','deepskyblue','cyan','lime','yellow','gold','red'],alpha=0.9,label=['DS','Murphy','Deng','Lin','W.Jiang','F.Xiao','X.Gao','The proposed method']) #指定不同颜色并设置透明度
# plt.xlabel('Combination Methods')
plt.xticks(rotation=45) # 倾斜70度
plt.ylabel('Mass of belief')
# plt.legend(['DS','Murphy','Deng','Lin','W.Jiang','F.Xiao','X.Gao','The proposed method'],
# 			ncol=1, 	# 图例要排成多少列
# 			loc=2,		# 图例的中心点
# 			bbox_to_anchor=(1.01, 1.0),		# 偏移的百分比
# 			borderaxespad=0.,
# 			fontsize=12,
# 			title="Combination Methods")  # 图例标题

# plt.legend()
plt.savefig("application.jpg")
plt.show()
