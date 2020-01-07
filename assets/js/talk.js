let Talk = {
	init(socket) {
		let path = window.location.pathname.split('/')
		let room = path[path.length - 1]
		let channel = socket.channel('talk:' + room, {})
		channel.join()
			.receive("ok", resp => { console.log("Successfully joined", resp) })
			this.listenForTalks(channel)
	},
	
	listenForTalks(channel) {
		function submitForm() {
			let UserNameTalk = document.getElementById('talk-user-name').value
			let userMsgTalk = document.getElementById('talk-user-msg').value
			
			channel.push('shout', {name: UserNameTalk, body: userMsgTalk})
			
			document.getElementById('talk-user-name').value = UserNameTalk
			document.getElementById('talk-user-msg').value = ''
		}
		
		channel.on('shout', (payload) => {
			let talkBox = document.querySelector("#talk-box")
			let txtBlock = document.createElement('p')
			
			txtBlock.insertAdjacentHTML('beforeend', `<b>${payload.name}:</b> ${payload.body}`)
			talkBox.appendChild(txtBlock)
		})
		
		document.getElementById('talk-form').addEventListener('submit', function(e) {
			e.preventDefault()
			submitForm()
		})
	}
}
	
export default Talk