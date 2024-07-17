import re
import json
file_path = r'D:\Flutter\project-jj-supreme-v1\project6m2\lib\public\chats.txt'

# new_chats = []
# with open(file_path, 'r', encoding='utf-8') as f:
#     x = f.read()
#     chats = x.split('\n')
#     # chats = s.split('\n')
#     for chat in chats:
#         if re.search('^../../.., ', chat) == None:
#             new_chats[-1] += '\n' +  chat
#         else:
#             new_chats.append(chat)

#     print(len(new_chats))

# for i in range(len(new_chats)):
#     if new_chats[i][11] == ':':
#         new_chats[i]  = new_chats[i][:10] + '0' + new_chats[i][10:]
#     new_chats[i] += '||||||||'

# with open('./lib/public/parsed.txt', 'w', encoding='utf-8') as f:
#     for chat in new_chats:
#         f.write(chat + '\n')

chats = []
dic = []
with open('./lib/public/parsed.txt', 'r', encoding='utf-8') as f:
    x = f.read()
    chats = [i.strip('|')[1:] if i[0] == '\n' else i.strip('|') for i in x.split('||||||||')]
    # for chat in chats:
    #     print(chat[chat.index(' - ') + 3:])
    # print()
    with open('./lib/public/parsed.json', 'w', encoding='utf-8') as js:
        for chat in chats:
            temp = {
                'Date': chat[:8],
                'Time': chat[10:15] + " " + chat[16:18],
                'Sender': chat[21: chat[21:].index(':') + 21] if chat.count(':') >= 2 else "Whatsapp",
                'Message': (chat[chat[21:].index(':') + 23 :] if chat.count(':') >= 2 else chat[chat.index(' - ') + 3:]),
                    }
            dic.append(temp)
        json.dump(dic, js, indent = 4)
    