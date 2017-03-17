local function run(msg, matches)
    if matches[1] == 'addkick' and is_admin(msg) then
        if gp_type(msg.to.id) == "channel" then
            tdcli.getChannelMembers(msg.to.id, 0, "Kicked", 200, function (i, naji)
                for k,v in pairs(naji.members_) do
                    tdcli.addChatMember(i.chat_id, v.user_id_, 50, dl_cb, nil)
                end
            end, {chat_id=msg.to.id})
            return "`اعضای محروم از گروه به گروه دعوت شدند `"
        end
        return "_😐  فقط در _`سوپر گروه`_ ممکن است_"
    end
end

return { 
patterns = { 
"^[!/#](addkick)$", 
}, 
run = run 
}
