function setvalue(address,flags,value)
    local nahuh
    nahuh = {}
    nahuh[1] = {}
    nahuh[1].address = address
    nahuh[1].flags = flags
    nahuh[1].value = value
    gg.setValues(nahuh)
    end

    local defaultspeed = defaultspeed
    local defaultcooldown = defaultcooldown
    local defaultdamage = defaultdamage
    local defaultrange = defaultrange
    
    defaultspeed = 1000000
    defaultcooldown = 0
    defaultdamage = 0
    defaultrange = 0
    
    
    DisableMO = "[❌]"
    
    function main()
    menu = gg.multiChoice({
        EnableMO1.."ปล่อยตัวรัว",
        EnableMO2.."คูณดาเมจ",
        EnableMO3.."ศัตรูตายอัตโนมัติ",
        EnableMO4.."ตีป้อมทีเดียว",
        EnableMO5.."เร่งเวลาเกม",
        EnableMO6.."ตีไกลและเดินทะลุ",
        EnableMO7.."จรวดไม่โดน",
        EnableMO8.."ป้องกันแบน / ป้องกันรีพอร์ต",
        DisableMO.."ออก"
    },nil," 🧨🩸 ℂℝ𝕀𝕄𝕊𝕆ℕ ℍ𝕌𝔹 🌳 ")
    
    if menu[1] == true then IN1() end
    if menu[2] == true then IN2() end
    if menu[3] == true then IN3() end
    if menu[4] == true then IN4() end
    if menu[5] == true then IN5() end
    if menu[6] == true then IN6() end
    if menu[7] == true then IN7() end
    if menu[8] == true then IN8() end
    if menu[9] == true then IN9() end
    end
    
    EnableMO1 = "[⭕]"
    function IN1()
        drop1 = gg.prompt({
            "ระยะเวลาปล่อยตัวค่าปกติคือ 0 [-1000;0]"
        },{defaultcooldown},{
                "number"
            })
            gg.toast("ลดเวลาปล่อยตัวกำลังทำงาน ⭕")
                RangesList = gg.getRangesList("libgame.so")[1].start
                offset = 0x47B934
                setvalue(RangesList + offset, 16,drop1[1])
                defaultcooldown = drop1[1]
                EnableMO1 = "[❌]"
        if drop1[1] == "0" or drop1[2] == "0" then
            gg.toast("ลดเวลาปล่อยตัวหยุดทำงานแล้ว ❌")
            EnableMO1 = "[⭕]"
        end
    end
    
    EnableMO2 = "[⭕]"
    function IN2()
        dropdmg = gg.prompt({
            "จำนวนที่ต้องการคูณ ค่าปกติคือ 0"
        },{defaultdamage},{
                "number"
            })
            gg.toast("คูณดาเมจแล้ว ⭕")
                RangesList = gg.getRangesList("libgame.so")[1].start
                offset = 0x5FF74C
                setvalue(RangesList + offset, 16,dropdmg[1])
                defaultdamage = dropdmg[1]
                EnableMO2 = "[❌]"
        if dropdmg[1] == "0" or dropdmg[2] == "0" then
            gg.toast("คูณดาเมจหยุดทำงานแล้ว ❌")
            EnableMO2 = "[⭕]"
        end
    end
    
    EnableMO3 = "[⭕]"
    function IN3()
        if EnableMO3 == "[⭕]" then
            gg.toast("ศัตรูตายอัตโนมัติกำลังทำงาน ⭕")
            RangesList = gg.getRangesList("libgame.so")[1].start
            offset = 0x5246F4
            setvalue(RangesList + offset, 16,100000)
            EnableMO3 = "[❌]"
        elseif EnableMO3 == "[❌]" then
            gg.toast("ศัตรูตายอัตโนมัติหยุดทำงานแล้ว ❌")
            RangesList = gg.getRangesList("libgame.so")[1].start
            offset = 0x5246F4
            setvalue(RangesList + offset, 16,-100)
            EnableMO3 = "[⭕]"
        end
    end
    
    EnableMO4  = "[⭕]"
    function IN4()
        if EnableMO4 == "[⭕]" then
            gg.toast("ตีป้อม 1ทีแตกกำลังทำงาน ⭕")
            RangesList = gg.getRangesList("libgame.so")[1].start
            offset = 0x48051C
            setvalue(RangesList + offset, 16,10000)
            EnableMO4 = "[❌]"
        elseif EnableMO4 == "[❌]" then
            gg.toast("ตีป้อม 1ทีแตกหยุดทำงานแล้ว ❌")
            RangesList = gg.getRangesList("libgame.so")[1].start
            offset = 0x48051C
            setvalue(RangesList + offset, 16,0)
            EnableMO4 = "[⭕]"
        end
    end
    
    EnableMO5  = "[⭕]"
    function IN5()
    drop5 = gg.prompt({
        "เร่งเวลาเกม ค่าปกติตือหนึ่งล้าน [100000;1000000]"
    },{defaultspeed},{
            "number"
        })
        gg.toast("เร่งเวลาเกมกำลังทำงาน ⭕")
            RangesList = gg.getRangesList("libgame.so")[1].start
            offset = 0xB943C8
            setvalue(RangesList + offset, 16,drop5[1])
    defaultspeed = drop5[1]
    EnableMO5 = "[❌]"
    if drop5[1] == "1000000" or drop5[2] == "1000000" then
        gg.toast("เร่งเวลาเกมหยุดทำงานแล้ว ❌")
        EnableMO5 = "[⭕]"
    end
    end

    EnableMO6 = "[⭕]"
    function IN6()
        drop10 = gg.prompt({
            "ถ้าปรับเป็นค่าติดลบจะเดินทะลุ หรือถ้าปรับเป็นค่าบวกจะตีไกล ปกติคือ 0"
        },{defaultrange},{
                "number"
            })
                RangesList = gg.getRangesList("libgame.so")[1].start
                offset = 0x53DE40
                setvalue(RangesList + offset, 16,drop10[1])
                defaultrange = drop10[1]
            gg.toast("เพิ่มระยะกำลังทำงาน ⭕")
            EnableMO6 = "[❌]"
        if drop10[1] == "0" or drop10[2] == "0" then
            gg.toast("เพิ่มระยะและเดินทะลุหยุดทำงานแล้ว ❌")
            EnableMO6 = "[⭕]"
        end
    end

    EnableMO7 = "[⭕]"
    function IN7()
        if EnableMO7 == "[⭕]" then
            gg.toast("จรวดไม่โดนกำลังทำงาน ⭕")
            RangesList = gg.getRangesList("libgame.so")[1].start
            offset = 0x4DF3A0
            setvalue(RangesList + offset, 16,-99999)
            EnableMO7 = "[❌]"
        elseif EnableMO7 == "[❌]" then
            gg.toast("จรวดไม่โดนหยุดทำงานแล้ว ❌")
            RangesList = gg.getRangesList("libgame.so")[1].start
            offset = 0x4DF3A0
            setvalue(RangesList + offset, 16,90)
            EnableMO7 = "[⭕]"
        end
    end

    EnableMO8 = "[⭕]"
    function IN8()
        if EnableMO8 == "[⭕]" then
            gg.toast("ป้องกันแบน / ป้องกันรีพอร์ตกำลังทำงาน ⭕")
            RangesList = gg.getRangesList("libgame.so")[1].start
            offset = 0x124856C
            setvalue(RangesList + offset, 16,"1.40129846e-40")
            EnableMO8 = "[❌]"
        elseif EnableMO8 == "[❌]" then
            gg.toast("ป้องกันแบน / ป้องกันรีพอร์ตหยุดทำงานแล้ว ❌")
            RangesList = gg.getRangesList("libgame.so")[1].start
            offset = 0x124856C
            setvalue(RangesList + offset, 16,"2.24207754e-43")
            EnableMO8 = "[⭕]"
        end
    end
    
    function IN9()
        gg.toast(" ❌GoodBye❌ ")
        os.exit()
        
    end
    
    while true do
    if gg.isVisible(true) then
    nom = 1
    gg.setVisible(false)
    end
    if nom == 1 then main() end
    nom = 0
    
    end
