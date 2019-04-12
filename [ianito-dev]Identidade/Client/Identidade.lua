﻿--[[
	@author: Iaan
	@since:1.0
	@website: www.maingames.com.br
	@description: Se caso você roubar(ou se eu vender ou doar), deixe meus creditos. Obg
]]--
local super = Class("Identidade", Container, function()
    static.getInstance = function()
        return LuaObject.getSingleton(static)
    end

end).getSuperclass()
function Identidade:init()
	super.init(self)
	self.screenX, self.screenY = Graphics.getInstance():getSize() -- podes usar Graphics.getInstance():getSize()
    self:setBounds(0,0,self.screenX,self.screenY)
    self:setBackground(tocolor(0,0,0,255))
 
	self:css([[
button {
	color: #FFFFFF;
	background-color: #990000;
	cursor: pointer;
}
button:hover {
	color: #FFFFFF;
	background-color: #770000;
	cursor: pointer;
}
button:active{
	color: #FFFFFF;
	background-color: #AA0000;
	cursor: pointer;
}    

  
]])

    self.panelExtern = Panel()
    self.panelExtern:setBounds(Graphics.getInsets(0,0,self.screenX/6.5,0))
    self.panelExtern:setSize(self.panelExtern:getWidth(),480)
    self.panelExtern:setLocation(self.screenX/3,self.screenY/4.5)
    self.panelExtern:setBackground(0,0,0,150)
	self.panelExtern:setBorder(LineBorder(tocolor(255,255,255),2))

	self:add(self.panelExtern)

    self.panelTitle = Panel()
    self.panelTitle:setBounds(0,0,self.panelExtern:getWidth(),55)
    self.panelTitle:setBackground(255,255,255,200)
    self.panelExtern:add(self.panelTitle)
    self:setVisible(true)

    self.labelTitle = Label("INFORMAÇÕES DO JOGADOR")
    self.labelTitle:setForeground(tocolor(0,0,0,255))
    self.labelTitle:setBackground(tocolor(255,255,255,1))
    self.labelTitle:setScale(1.2)
    self.labelTitle:setBounds(0,0,self.panelTitle:getWidth(),self.panelTitle:getHeight())
    self.labelTitle:setAlignment(Label.CENTER)
    self.panelTitle:add(self.labelTitle)


    self.avatar = Image()
	self.avatar:setSource("Gfx/logo.png")
	self.avatar:setLocation(25,(self.panelTitle:getY()+self.panelTitle:getHeight()) + 20)
    self.avatar:setSize(150,150)
    self.panelExtern:add(self.avatar)


    
    self.panelInfo = Panel()
    self.panelInfo:setBounds(Graphics.getInsets(0,0,140,0))
    self.panelInfo:setSize(self.panelInfo:getWidth(),150)
    self.panelInfo:setLocation((self.avatar:getWidth()+self.avatar:getX()) + 20,self.panelTitle:getY()+self.panelTitle:getHeight()+20)
    --self.panelInfo:setBorder(LineBorder(tocolor(255,255,0),2))
    self.panelInfo:setBackground(tocolor(0,0,0,0))
    self.panelExtern:add(self.panelInfo)
    
    local color = tocolor(255,255,255)
    local scale = 1.09
    local margin = 28
    local alignment = Label.CENTER

    self.labelNick = Label("NICK:")
    self.labelNick:setForeground(tocolor(255,255,255,255))
    self.labelNick:setBackground(tocolor(0,0,0))
    self.labelNick:setScale(scale)
    self.labelNick:setBounds(5,0,self.panelInfo:getWidth(),margin)
    self.labelNick:setAlignment(alignment)
    self.panelInfo:add(self.labelNick)

    self.labelVida = Label("VIDA:")
    self.labelVida:setForeground(tocolor(255,255,255,255))
    self.labelVida:setBackground(tocolor(0,0,0))
    self.labelVida:setScale(scale)
    self.labelVida:setBounds(5,self.labelNick:getHeight(),self.panelInfo:getWidth(),margin)
    self.labelVida:setAlignment(alignment)
    self.panelInfo:add(self.labelVida)

    self.labelColete = Label("COLETE:")
    self.labelColete:setForeground(tocolor(255,255,255,255))
    self.labelColete:setBackground(tocolor(0,0,0))
    self.labelColete:setScale(scale)
    self.labelColete:setBounds(5,self.labelVida:getY()+self.labelVida:getHeight(),self.panelInfo:getWidth(),margin)
    self.labelColete:setAlignment(alignment)
    self.panelInfo:add(self.labelColete)

    self.labelHours = Label("HORAS JOGADAS:")
    self.labelHours:setForeground(tocolor(255,255,255,255))
    self.labelHours:setBackground(tocolor(0,0,0))
    self.labelHours:setScale(scale)
    self.labelHours:setBounds(5,self.labelColete:getY()+self.labelColete:getHeight(),self.panelInfo:getWidth(),margin)
    self.labelHours:setAlignment(alignment)
    self.panelInfo:add(self.labelHours)

    self.labelLocation = Label("LOCALIZAÇÃO:")
    self.labelLocation:setForeground(tocolor(255,255,255,255))
    self.labelLocation:setBackground(tocolor(0,0,0))
    self.labelLocation:setScale(scale)
    self.labelLocation:setBounds(5,self.labelHours:getY()+self.labelHours:getHeight(),self.panelInfo:getWidth(),margin)
    self.labelLocation:setAlignment(alignment)
    self.panelInfo:add(self.labelLocation)


        local scale = 1.2
        local margin = 35
    self.panelLabel = Panel()
    self.panelLabel:setBounds(Graphics.getInsets(0,0,85,0))
    self.panelLabel:setSize(self.panelLabel:getWidth(),180)
    --self.panelLabel:setBorder(LineBorder(tocolor(255,255,0),2))
    
    self.panelLabel:setLocation(25,self.panelTitle:getY()+self.panelTitle:getHeight()+self.avatar:getHeight()+25)
	self.panelLabel:setBackground(tocolor(0,0,0,0))
    self.panelExtern:add(self.panelLabel)

    self.labelEditNome = Label("NICK:")
    self.labelEditNome:setForeground(tocolor(255,255,255,255))
    self.labelEditNome:setBackground(tocolor(0,0,0))
    self.labelEditNome:setScale(scale)
    self.labelEditNome:setBounds(5,5,self.panelLabel:getWidth()-5,margin)
    self.labelEditNome:setAlignment(alignment)
    self.panelLabel:add(self.labelEditNome)

    self.labelEditIdade = Label("IDADE:")
    self.labelEditIdade:setForeground(tocolor(255,255,255,255))
    self.labelEditIdade:setBackground(tocolor(0,0,0))
    self.labelEditIdade:setScale(scale)
    self.labelEditIdade:setBounds(5,self.labelEditNome:getY()+self.labelEditNome:getHeight(),self.panelLabel:getWidth()-5,margin)
    self.labelEditIdade:setAlignment(alignment)
    self.panelLabel:add(self.labelEditIdade)

    self.labelEditEmail = Label("EMAIL:")
    self.labelEditEmail:setForeground(tocolor(255,255,255,255))
    self.labelEditEmail:setBackground(tocolor(0,0,0))
    self.labelEditEmail:setScale(scale)
    self.labelEditEmail:setBounds(5,self.labelEditIdade:getY()+self.labelEditIdade:getHeight(),self.panelLabel:getWidth()-5,margin)
    self.labelEditEmail:setAlignment(alignment)
    self.panelLabel:add(self.labelEditEmail)

    self.labelEditSexo = Label("SEXO:")
    self.labelEditSexo:setForeground(tocolor(255,255,255,255))
    self.labelEditSexo:setBackground(tocolor(0,0,0))
    self.labelEditSexo:setScale(scale)
    self.labelEditSexo:setBounds(5,self.labelEditEmail:getY()+self.labelEditEmail:getHeight(),self.panelLabel:getWidth()-5,margin)
    self.labelEditSexo:setAlignment(alignment)
    self.panelLabel:add(self.labelEditSexo)

    self.labelEditNacio = Label("NACIONALIDADE:")
    self.labelEditNacio:setForeground(tocolor(255,255,255,255))
    self.labelEditNacio:setBackground(tocolor(0,0,0))
    self.labelEditNacio:setScale(scale)
    self.labelEditNacio:setBounds(5,self.labelEditSexo:getY()+self.labelEditSexo:getHeight(),self.panelLabel:getWidth()-5,margin)
    self.labelEditNacio:setAlignment(alignment)
    self.panelLabel:add(self.labelEditNacio)


    self.panelEdit = Panel()
    self.panelEdit:setBounds(Graphics.getInsets(0,0,140,0))
    self.panelEdit:setSize(self.panelEdit:getWidth(),180)
    self.panelEdit:setLocation(self.panelLabel:getX()+self.panelLabel:getWidth()+5,self.panelLabel:getY())
    --self.panelEdit:setBorder(LineBorder(tocolor(255,255,0),2))
    self.panelEdit:setBackground(tocolor(0,0,0,0))
    self.panelExtern:add(self.panelEdit)

    self.fieldNome = TextField();
    self.fieldNome:setPlaceholder("Digite o Login...")
	self.fieldNome:setBounds(0,0,self.panelEdit:getWidth(),30)
    self.fieldNome:setForeground(0,0,0)
    self.fieldNome:setBackground(255,255,255,200)  
    self.fieldNome:setZOrder(20)
    self.panelEdit:add(self.fieldNome)
    
    self.fieldIdade = TextField();
    self.fieldIdade:setPlaceholder("*")
	self.fieldIdade:setBounds(0,self.labelEditIdade:getY(),100,30)
    self.fieldIdade:setForeground(0,0,0)
    self.fieldIdade:setBackground(255,255,255,200)  
    self.fieldIdade:setZOrder(20)
    self.panelEdit:add(self.fieldIdade)
    
    self.fieldEmail = TextField();
    self.fieldEmail:setPlaceholder("email@hotmail.com")
	self.fieldEmail:setBounds(0,self.labelEditEmail:getY(),self.panelEdit:getWidth(),30)
    self.fieldEmail:setForeground(0,0,0)
    self.fieldEmail:setBackground(255,255,255,200)  
    self.fieldEmail:setZOrder(20)
    self.panelEdit:add(self.fieldEmail)

    self.chkMasc = Checkbox("MASCULINO",false,nil)
	self.chkMasc:setBounds(0,self.labelEditSexo:getY(),25,25)
	self.chkMasc:setBackground(0,0,0)
	self.chkMasc:setForeground(tocolor(255,255,255,255))
	self.chkMasc:setLabelColor(tocolor(255,255,255))
	self.chkMasc:getLabel()
    self.panelEdit:add(self.chkMasc)
    
    self.chkFem = Checkbox("FEMININO",false,nil)
	self.chkFem:setBounds(120,self.labelEditSexo:getY(),25,25)
	self.chkFem:setBackground(0,0,0)
	self.chkFem:setForeground(tocolor(255,255,255,255))
	self.chkFem:setLabelColor(tocolor(255,255,255))
	self.chkFem:getLabel()
    self.panelEdit:add(self.chkFem)
    
    
    self.chkBR = Checkbox("BRASILEIRA",false,nil)
	self.chkBR:setBounds(0,self.labelEditNacio:getY(),25,25)
	self.chkBR:setBackground(0,0,0)
	self.chkBR:setForeground(tocolor(255,255,255,255))
	self.chkBR:setLabelColor(tocolor(255,255,255))
	self.chkBR:getLabel()
    self.panelEdit:add(self.chkBR)
    
    self.chkEstran = Checkbox("ESTRANGEIRA",false,nil)
	self.chkEstran:setBounds(120,self.labelEditNacio:getY(),25,25)
	self.chkEstran:setBackground(0,0,0)
	self.chkEstran:setForeground(tocolor(255,255,255,255))
	self.chkEstran:setLabelColor(tocolor(255,255,255))
	self.chkEstran:getLabel()
	self.panelEdit:add(self.chkEstran)
    
    self.buttonSave = Button("SALVAR")
    self.buttonSave:setBounds((self.panelExtern:getWidth()/2)-205/2,self.panelExtern:getHeight()-60,205,40)
    
    self.buttonSave:setStyleClass("btnLogin")
	self.buttonSave:addMouseListener(self)
	self.panelExtern:add(self.buttonSave)

    return self
end


addEventHandler("onClientResourceStart", resourceRoot, function()
    Toolkit.getInstance():add(Identidade.getInstance())
end)


