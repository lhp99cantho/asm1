const btnDelete = document.querySelectorAll(".delete-btn")

btnDelete.forEach((e) => {
    e.onclick = () => {
        const id = e.getAttribute("data-id")
        fetch("/employee", {
            method: "DELETE",
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(id),
        })
            .then((res) =>
                location.reload()
            )
            .catch((err) => console.error(err))
    }
})