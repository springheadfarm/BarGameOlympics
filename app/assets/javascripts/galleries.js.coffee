jQuery ->

	alert('dom loaded')

	Galleria.run('.galleria', {
		dataSource: galleria_data,
		height: '550px',
		theme: 'twelve',
		imageCrop: false,
		transition: 'fade',
		fullscreenCrop: false,
		fullscreenTransition: 'fade'
	});

