package org.dfw2gug



import org.junit.*
import grails.test.mixin.*

@TestFor(WorkController)
@Mock(Work)
class WorkControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/work/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.workInstanceList.size() == 0
        assert model.workInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.workInstance != null
    }

    void testSave() {
        controller.save()

        assert model.workInstance != null
        assert view == '/work/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/work/show/1'
        assert controller.flash.message != null
        assert Work.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/work/list'


        populateValidParams(params)
        def work = new Work(params)

        assert work.save() != null

        params.id = work.id

        def model = controller.show()

        assert model.workInstance == work
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/work/list'


        populateValidParams(params)
        def work = new Work(params)

        assert work.save() != null

        params.id = work.id

        def model = controller.edit()

        assert model.workInstance == work
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/work/list'

        response.reset()


        populateValidParams(params)
        def work = new Work(params)

        assert work.save() != null

        // test invalid parameters in update
        params.id = work.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/work/edit"
        assert model.workInstance != null

        work.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/work/show/$work.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        work.clearErrors()

        populateValidParams(params)
        params.id = work.id
        params.version = -1
        controller.update()

        assert view == "/work/edit"
        assert model.workInstance != null
        assert model.workInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/work/list'

        response.reset()

        populateValidParams(params)
        def work = new Work(params)

        assert work.save() != null
        assert Work.count() == 1

        params.id = work.id

        controller.delete()

        assert Work.count() == 0
        assert Work.get(work.id) == null
        assert response.redirectedUrl == '/work/list'
    }
}
