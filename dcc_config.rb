send_notifications_to({
  scrivito: 'falk.koeppe@scrivito.com',
})

buckets 'kickstarter' do
  bucket('test:integration').performs_rake_tasks 'test:integration'
end
