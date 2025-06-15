window.addEventListener('message', function(event) {
    const data = event.data;
    const labelsWrapper = document.getElementById('labels-wrapper');

    if (data.type !== 'updateLabels') {
        return;
    }

    labelsWrapper.innerHTML = '';

    if (data.labels && data.labels.length > 0) {
        data.labels.forEach(function(labelData) {
            const labelElement = document.createElement('div');
            labelElement.classList.add('label-item');
            labelElement.textContent = labelData.label;

            labelElement.style.left = `${labelData.x * 100}%`;
            labelElement.style.top = `${labelData.y * 100}%`;

            labelsWrapper.appendChild(labelElement);
        });
    }
});
